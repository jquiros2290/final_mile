class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :city
      t.string :state
      t.references :user, index: true, foreign_key: true
      t.integer :carrier

      t.timestamps null: false
    end
  end
end
