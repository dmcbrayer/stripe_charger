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

	subject {@trip}

	it {should respond_to(:title)}
	it {should respond_to(:leader)}
	it {should respond_to(:price)}
	it {should respond_to(:start_date)}
	it {should respond_to(:end_date)}

end
