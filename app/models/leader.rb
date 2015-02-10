class Leader < ActiveRecord::Base
	validates :name, presence: true
end
