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
    puts params[:stripeToken]
    customer = Stripe::Customer.create(
      description: "Hiker Meals Customer",
      email: params[:email],
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
        exp_month: params[:exp_month],
        exp_year: params[:exp_year],
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

end
