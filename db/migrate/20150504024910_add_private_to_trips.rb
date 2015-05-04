class AddPrivateToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :private_trip, :boolean, default: false
  end
end
