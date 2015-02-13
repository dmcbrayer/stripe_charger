# == Schema Information
#
# Table name: leaders
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :leader do
    name "MyString"
		email "user@example.com"
		phone 2054225555
  end

end
