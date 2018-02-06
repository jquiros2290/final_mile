class RemoveCarrierFromItem < ActiveRecord::Migration
  def change
    remove_column :items, :carrier, :integer
  end
end
