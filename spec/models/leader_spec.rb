require 'rails_helper'

RSpec.describe Leader, :type => :model do
  
	describe "has the appropriate attributes" do
	  before do
	  	@leader = FactoryGirl.create(:leader)
		end

		subject {@leader}

		it {should respond_to(:name)}
		it {should respond_to(:email)}
	end
end
