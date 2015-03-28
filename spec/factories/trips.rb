# == Schema Information
#
# Table name: trips
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  leader      :integer
#  start_date  :date
#  end_date    :date
#  price       :integer
#  created_at  :datetime
#  updated_at  :datetime
#  description :text
#  custom      :boolean          default(FALSE)
#

FactoryGirl.define do
  factory :trip do
    title "MyString"
    leader 1
    price 50
    start_date Date.today
    end_date Date.today + 3
  end

end
