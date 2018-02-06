class AddOffToItem < ActiveRecord::Migration
  def change
    add_column :items, :offer, :integer
  end
end
