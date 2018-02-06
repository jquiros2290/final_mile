class AddDeliveryToItem < ActiveRecord::Migration
  def change
    add_reference :items, :delivery, index: true, foreign_key: true
  end
end
