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

	before do
		@trip = FactoryGirl.create(:trip)
	end

	describe "Model set up" do

		subject {@trip}

		it {is_expected.to respond_to(:title)}
		it {is_expected.to respond_to(:leader)}
		it {is_expected.to respond_to(:price)}
		it {is_expected.to respond_to(:start_date)}
		it {is_expected.to respond_to(:end_date)}

		it {is_expected.to be_valid}
	end

	describe "when title is blank" do
		before {@trip.title = " "}
		it {is_expected.to_not be_valid}
	end

	describe "when there is no leader" do
		before {@trip.leader = nil}
		it {is_expected.to_not be_valid}
	end

	describe "when price is blank" do
		before {@trip.price = " "}
		it {is_expected.to_not be_valid}
	end

	
end
