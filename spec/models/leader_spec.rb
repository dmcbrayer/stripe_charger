require 'rails_helper'

RSpec.describe Leader, :type => :model do
  
  before(:each) do
  	@leader = FactoryGirl.create(:leader)
	end

	describe "Model set up" do

		subject {@leader}

		it {is_expected.to respond_to(:name)}
		it {is_expected.to respond_to(:email)}

		it {is_expected.to be_valid}
	end

	describe "when name is blank" do
		before {@leader.name = ""}
		it {is_expected.to_not be_valid}
	end

	
	context "email validations" do

		describe "when email format is invalid" do
	    it "should be invalid" do
	      emails = %w[user@foo,com user_at_foo.org example.user@foo.
	                     foo@bar_baz.com foo@bar+baz.com foo@bar..com]
	      emails.each do |invalid_address|
	        @leader.email = invalid_address
	        expect(@leader).not_to be_valid
	      end
	    end
	  end

	  describe "when email format is valid" do
	    it "should be valid" do
	      emails = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
	      emails.each do |valid_address|
	        @leader.email = valid_address
	        expect(@leader).to be_valid
	      end
	    end
	  end

	  describe "when email is blank" do
			before {@leader.email = ""}
			it {is_expected.to_not be_valid}
		end
		
	end


end
