class RemoveOfferFromItem < ActiveRecord::Migration
  def change
    remove_column :items, :offer, :money
  end
end
