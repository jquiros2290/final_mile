class RemoveDeliveredFromDelivery < ActiveRecord::Migration
  def change
    remove_column :deliveries, :delivered, :boolean
  end
end
