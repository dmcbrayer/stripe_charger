require 'rails_helper'

RSpec.describe Attendee, :type => :model do
  
	describe "Model set up" do

		before do
	  	@trip = FactoryGirl.create(:trip)
	  	@attendee = @trip.attendees.create(FactoryGirl.attributes_for(:attendee))
		end

		subject {@attendee}

		it {should respond_to(:name)}
		it {should respond_to(:email)}
		it {should respond_to(:phone)}
		it {should respond_to(:trip_id)}
	end

	
end
