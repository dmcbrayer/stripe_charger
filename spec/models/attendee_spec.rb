require 'rails_helper'

RSpec.describe Attendee, :type => :model do
  before do
  	@trip = FactoryGirl.create(:trip)
	end

	subject {@attendee}

	it {should respond_to(:name)}
	it {should respond_to(:email)}
	it {should respond_to(:phone)}
	it {should respond_to(:trip_id)}
end
