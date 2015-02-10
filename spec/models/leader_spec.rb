require 'rails_helper'

RSpec.describe Leader, :type => :model do
  
  before(:each) do
  	@leader = FactoryGirl.create(:leader)
	end

	describe "Model set up" do

		subject {@leader}

		it {should respond_to(:name)}
		it {should respond_to(:email)}

		it {should be_valid}
	end

	describe "when name is blank" do
		before {@leader.name = ""}
		it {is_expected.to_not be_valid}
	end
end
