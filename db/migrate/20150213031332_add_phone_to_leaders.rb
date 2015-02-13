class AddPhoneToLeaders < ActiveRecord::Migration
  def change
  	add_column :leaders, :phone, :string
  end
end
