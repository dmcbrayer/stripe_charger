# == Schema Information
#
# Table name: attendees
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  phone      :string(255)
#  trip_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  paid       :boolean          default(FALSE)
#  card_error :boolean          default(FALSE)
#

class Attendee < ActiveRecord::Base
	belongs_to :trip

  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true

  after_create :send_notification
  after_create :admin_messages

	def get_customer_from_stripe
    # Add customer id to User model
    cus_id = self.customer_id
    customer = Stripe::Customer.retrieve(cus_id)
    return customer
  end

  def create_stripe_customer(params, token)
    customer = Stripe::Customer.create(
      description: "Vestigo Customer",
      email: params[:attendee][:email],
      card: token.id
    )
    self.update_attributes(customer_id: customer.id)
  end

  def charge_stripe(amount, params)
    token = self.create_stripe_token(params)

    unless self.customer_id
      self.create_stripe_customer(params, token)
    end

    charge = Stripe::Charge.create(
      customer: self.customer_id,
      amount: amount,
      description: "Vestigo Trip charge",
      currency: 'usd'
    )
    return charge
  end

  def create_stripe_token(params)
    token = Stripe::Token.create(
      card: {
        number: params[:number],
        exp_month: exp_month_year_to_month(params[:credit_card_expiry]),
        exp_year: exp_month_year_to_year(params[:credit_card_expiry]),
        cvc: params[:cvc]
      }
    )
    return token
  end

  def send_notification
    AttendeeMailer.new_attendee(self)
  end


  def admin_messages
    first = is_first?

    if first == true
      first_message
    else
      new_sign_up_message
    end
  end

  def is_first?

    count = self.trip.attendees.count

    if count > 1
      false
    else
      true
    end

  end

  def first_message
    AttendeeMailer.first_message(self).deliver
  end

  def new_sign_up_message
    AttendeeMailer.new_sign_up_message(self).deliver
  end

  private

    def exp_month_year_to_month(monthyear)
      month = monthyear.split(" / ").first
      return month
    end

    def exp_month_year_to_year(monthyear)
      year = monthyear.split(" / ").last
      return year
    end

end
