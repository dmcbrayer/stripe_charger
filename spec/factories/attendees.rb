# == Schema Information
#
# Table name: attendees
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  phone      :string(255)
#  trip_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  paid       :boolean          default(FALSE)
#  card_error :boolean          default(FALSE)
#

FactoryGirl.define do
  factory :attendee do
    name "Tina"
    email "user@example.com"
    phone "555 555 5555"
    paid false
  end

end
