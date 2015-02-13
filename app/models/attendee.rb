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

  after_create :send_notification

	def charge_stripe(amount, params)

    amount_in_cents = amount*100

		customer = Stripe::Customer.create(
      description: "Vestigo Customer",
      email: params[:email],
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: amount_in_cents,
      description: 'Vestigo trip',
      currency: 'usd'
    )

  end

  def send_notification
    AdminMailer.new_attendee(self).deliver
  end
end
