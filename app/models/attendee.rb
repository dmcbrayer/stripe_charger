class Attendee < ActiveRecord::Base
	belongs_to :trip


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

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to trips_path
  end
end
