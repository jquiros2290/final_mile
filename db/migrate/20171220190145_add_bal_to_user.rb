class AddBalToUser < ActiveRecord::Migration
  def change
    add_column :users, :balance, :integer
  end
end
