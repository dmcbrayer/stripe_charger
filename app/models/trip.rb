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

class Trip < ActiveRecord::Base
	has_many :attendees

	validates :title, presence: true
	validates :leader, presence: true
	validates :price, presence: true
	
  default_scope -> { where( 'start_date > ?', Date.today - 1).all}
  default_scope -> { order(:start_date => :asc)}

  after_create :notify_of_private

	def get_leader
		Leader.find(self.leader)
	end

  def notify_of_private
    TripMailer.notify_admin(self).deliver
  end
end
