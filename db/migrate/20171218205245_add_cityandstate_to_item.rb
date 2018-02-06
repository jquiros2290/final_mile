class AddCityandstateToItem < ActiveRecord::Migration
  def change
    add_column :items, :del_city, :string
    add_column :items, :del_state, :string
  end
end
