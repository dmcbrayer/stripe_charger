class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :title
      t.integer :leader
      t.date :start_date
      t.date :end_date
      t.integer :price

      t.timestamps
    end
  end
end
