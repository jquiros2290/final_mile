class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.references :item, index: true, foreign_key: true
      t.integer :offerer_id
      t.money :offer

      t.timestamps null: false
    end
  end
end
