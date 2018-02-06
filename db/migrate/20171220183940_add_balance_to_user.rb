class AddBalanceToUser < ActiveRecord::Migration
  def change
    add_column :users, :balance, :money, default: 0
  end
end
