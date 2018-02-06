class AddDeliveredToDelivery < ActiveRecord::Migration
  def change
    add_column :deliveries, :delivered, :boolean, default: false
  end
end
ex