# == Schema Information
#
# Table name: trips
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  leader     :integer
#  start_date :date
#  end_date   :date
#  price      :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Trip, :type => :model do

	before(:each) do
		@trip = FactoryGirl.create(:trip)
	end

	describe "Model set up" do

		subject {@trip}

		it {should respond_to(:title)}
		it {should respond_to(:leader)}
		it {should respond_to(:price)}
		it {should respond_to(:start_date)}
		it {should respond_to(:end_date)}

		it {should be_valid}
	end

	describe "when title is blank" do
		before {@trip.title = ""}
		it {is_expected.to_not be_valid}
	end
	
end
