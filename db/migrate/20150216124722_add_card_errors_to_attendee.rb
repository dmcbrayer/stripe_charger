class AddCardErrorsToAttendee < ActiveRecord::Migration
  def change
  	add_column :attendees, :card_error, :boolean, default: false
  end
end
