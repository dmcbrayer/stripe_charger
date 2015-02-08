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
  pending "add some examples to (or delete) #{__FILE__}"
end
