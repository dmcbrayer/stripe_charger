class AddPaidToAttendees < ActiveRecord::Migration
  def change
  	add_column :attendees, :paid, :boolean, default: false
  end
end
