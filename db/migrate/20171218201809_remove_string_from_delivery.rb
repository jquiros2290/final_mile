class RemoveStringFromDelivery < ActiveRecord::Migration
  def change
    remove_column :deliveries, :string, :string
  end
end
