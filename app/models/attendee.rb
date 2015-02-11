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

	def charge_stripe(amount, params)

		customer = Stripe::Customer.create(
      description: "Ventura Customer",
      email: params[:email],
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: amount,
      description: 'Ventura trip',
      currency: 'usd'
    )

  end
end
