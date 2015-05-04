# == Schema Information
#
# Table name: trips
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  leader       :integer
#  start_date   :date
#  end_date     :date
#  price        :integer
#  created_at   :datetime
#  updated_at   :datetime
#  description  :text
#  custom       :boolean          default(FALSE)
#  private_trip :boolean          default(FALSE)
#

require 'rails_helper'

RSpec.describe Trip, :type => :model do

	before(:each) do
		@trip = FactoryGirl.create(:trip)
	end

	describe "Model set up" do

		subject {@trip}

		it {is_expected.to respond_to(:title)}
		it {is_expected.to respond_to(:leader)}
		it {is_expected.to respond_to(:price)}
		it {is_expected.to respond_to(:start_date)}
		it {is_expected.to respond_to(:end_date)}
		it {is_expected.to respond_to(:custom)}
		it {is_expected.to respond_to(:private_trip)}

		it {is_expected.to be_valid}
	end

	describe "when title is blank" do

		it "should be invalid" do
			@trip.title = " "
			expect(@trip).not_to be_valid
		end
	end

	describe "when there is no leader" do
		it "should be invalid" do
			@trip.leader = nil
			expect(@trip).not_to be_valid
		end
	end

	describe "when price is blank" do
		it "should be invalid" do
			@trip.price = " "
			expect(@trip).not_to be_valid
		end
	end

	describe "#custom" do
		it "should default to false" do
			expect(@trip.custom).to eq(false)
		end
	end

	describe "#private_trip" do
		it "should default to false" do
			expect(@trip.private_trip).to eq(false)
		end
	end

	
end
