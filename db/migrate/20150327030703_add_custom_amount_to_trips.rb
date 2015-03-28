class AddCustomAmountToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :custom, :boolean, default: false
  end
end
