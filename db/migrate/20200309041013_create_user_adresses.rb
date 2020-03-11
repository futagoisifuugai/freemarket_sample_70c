class CreateUserAdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_adresses do |t|
      t.string :first_name,             null: false, limit: 50
      t.string :last_name,              null: false, limit: 50
      t.string :first_name_kana,        null: false, limit: 50
      t.string :last_name_kana,         null: false, limit: 50
      t.string :prefectures,             null: false
      t.string :city,                    null: false, limit: 20
      t.string :city_adress,             null: false, limit: 20
      t.string :building,                limit: 50
      t.string :phone_number           
      t.integer :postal_code,            null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
