class AddCustomerIdColToAttendeeModel < ActiveRecord::Migration
  def change
    add_column :attendees, :customer_id, :string
  end
end
