require 'rails_helper'

RSpec.describe Attendee, :type => :model do
  
  before(:each) do
  	@trip = FactoryGirl.create(:trip)
  	@attendee = @trip.attendees.create(FactoryGirl.attributes_for(:attendee))
	end

	describe "Model set up" do

		subject {@attendee}

		it {is_expected.to respond_to(:name)}
		it {is_expected.to respond_to(:email)}
		it {is_expected.to respond_to(:phone)}
		it {is_expected.to respond_to(:trip_id)}

		it {is_expected.to be_valid}

	end

	describe "when name is blank" do
		before {@attendee.name = ""}
		it {is_expected.to_not be_valid}
	end

	
end
