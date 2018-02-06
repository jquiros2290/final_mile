class AddOfferToItem < ActiveRecord::Migration
  def change
    add_column :items, :offer, :money, default: 0
  end
end
