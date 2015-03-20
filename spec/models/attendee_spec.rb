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

require 'rails_helper'

RSpec.describe Attendee, :type => :model do
  
  before(:each) do
  	@leader = FactoryGirl.create(:leader)
  	@trip = FactoryGirl.create(:trip)
  	@attendee = @trip.attendees.create(FactoryGirl.attributes_for(:attendee))
	end

	after(:each) do
		ActionMailer::Base.deliveries.clear
	end

	describe "Model set up" do

		subject {@attendee}

		it {is_expected.to respond_to(:name)}
		it {is_expected.to respond_to(:email)}
		it {is_expected.to respond_to(:phone)}
		it {is_expected.to respond_to(:paid)}
		it {is_expected.to respond_to(:trip_id)}

		it {is_expected.to be_valid}

	end

	describe "Mailer functions" do
		it "should send an email" do
			expect {@attendee.admin_messages }.to change { ActionMailer::Base.deliveries.count }.by(1)
		end

		it "should be sent from the correct address" do
			expect(ActionMailer::Base.deliveries.first.from).to eql(['no-reply@vestigo.co'])
		end

		describe "correct email gets sent" do
			it "sends first message for the first attendee" do
				expect(ActionMailer::Base.deliveries.first.subject).to include("First sign up")
			end

			it "sends the new sign up message for subsequent attendees" do
				attendee2 = @trip.attendees.create(FactoryGirl.attributes_for(:attendee))
				expect(ActionMailer::Base.deliveries[1].subject).to include("New sign up")
			end
		end
	end

	describe "paid should default to false" do
		it "should be false" do
			expect(@attendee.paid).to eq(false)
		end
	end

	describe "when name is blank" do
		it "should be invalid" do
			@attendee.name = ""
			expect(@attendee).not_to be_valid
		end
	end

	describe "when email is blank" do
		it "should be invalid" do
			@attendee.email = ""
			expect(@attendee).not_to be_valid
		end
	end

	describe "when phone is blank" do
		it "should be invalid" do
			@attendee.phone = ""
			expect(@attendee).not_to be_valid
		end
	end

	describe "Stripe charging" do
		let(:stripe_helper) { StripeMock.create_test_helper }
	  before(:each) { StripeMock.start }
	  after(:each) { StripeMock.stop }

		describe "when card information is valid" do

			it "creates a Stripe customer" do
				customer = Stripe::Customer.create({
		      email: 'johnny@appleseed.com',
		      card: stripe_helper.generate_card_token
		    })
		    expect(customer.email).to eq('johnny@appleseed.com')
		    expect{customer}.to_not raise_error
			end

			it "charges the stripe card" do
		    charge = Stripe::Charge.create(
		      card: stripe_helper.generate_card_token,
		      amount: 500,
		      description: 'Vestigo trip',
		      currency: 'usd'
		    )
		    expect{charge}.to_not raise_error
			end
		end

		describe "when card information is invalid" do
			pending
		end
	end
end
