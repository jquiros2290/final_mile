class AddStatusToOffer < ActiveRecord::Migration
  def change
    add_column :offers, :status, :string, default: "pending"
  end
end
