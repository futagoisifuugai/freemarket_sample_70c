class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :seller, null: false, foreign_key: { to_table: :users }
      t.references :categorie
      t.string :size
      t.references :brand, foreign_key: true
      t.references :condition, null: false, foreign_key: true
      t.string :name, null: false
      t.text :description, null: false
      t.integer :postage_burden, null: false
      t.references :sending_method
      t.references :area, null: false, foreign_key: true
      t.integer :scheduled_sending_date, null: false
      t.integer :price, null: false
      t.references :buyer, foreign_key: { to_table: :users }
      t.integer :buyed_time
      t.string :payment_method
      t.integer :payment_status
      t.string :recieving_status
    end
  end
end
