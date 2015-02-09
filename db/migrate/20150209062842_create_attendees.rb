class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.belongs_to :trip, index: true

      t.timestamps
    end
  end
end
