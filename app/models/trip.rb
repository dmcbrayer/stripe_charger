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

class Trip < ActiveRecord::Base
	has_many :attendees

	validates :title, presence: true
	validates :leader, presence: true
	validates :price, presence: true

	default_scope -> { order(:start_date => :asc) }
end
