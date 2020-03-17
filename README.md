# freemarket_sample_70c DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|mail|string|null: false|
|password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday|date|null: false|
|phone_number|integer|null: false|
|icon|text||
|introduction|text||
### Association
- has_many :products
- has_many :comments
- has_one :user_address
- has_one :credit_card
- accepts_nested_attributes_for :user_address
### add_index
- add_index :email, unique: true
- add_index :reset_password_token, unique: true
## productsテーブル
|Column|Type|Options|
|------|----|-------|
|seller_id|references|null: false,foreign_key:{ to_table::users }|
|categorie_id|references|null: false,foreign_key:true|
|size_id|references|foreign_key:true|
|brand_id|references|foreign_key:true|
|condition_id|references|null: false,foreign_key:true|
|name|string|null: false|
|description|text|null: false|
|postage_burden|integer|null: false|
|sending_method-id|references|null: false,foreign_key:true|
|area|text|null:false|
|scheduled_sending_date|integer|null: false|
|price|integer|null: false|
|buyer_id|references|null: false,foreign_key: { to_table: :users }|
|buyed_time|integer||
|payment_method|string|null: false|
|payment_status|integer|null: false|
|recieving_status|string|null: false|
|image_id|references|null: false,foreign_key:true|
### Association
- has_many :images, dependent: :destroy
- accepts_nested_attributes_for :images, allow_destroy: true
- has_many :comments
- has_many :users
- has_one :seller_evaluation
- has_one :buyer_evaluation
- belongs_to :categorie
- belongs_to :brand, optional: true
- belongs_to :size, optional: true
- belongs_to :condition
- belongs_to :sending_method
## user_adressesテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false, limit: 50|
|last_name|string|null: false, limit: 50|
|first_name_kana|string|null: false, limit: 50|
|last_name_kana|string|null: false, limit: 50|
|postal_code|integer|null: false|
|prefectures|string|null: false|
|city|string|null: false, limit: 20|
|city_adress|string|null: false, limit: 20|
|building|string|limit: 50|
|phone_number|integer|limit: 11|
### Association
- belongs_to :user, inverse_of: :user_address
## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
|comment|text|null: false|
### Association
- belongs_to :user
- belongs_to :product
## identity_informationsテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|city_adress|string|null: false|
|building|string|null: false|
### Association
## imageテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product_id|references|null: false, foreign_key: true|
### Association
- belongs_to :product
## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|deadline|integer|null: false|
|security_cord|integer|null: false|

### Association
- belongs_to :user
## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|value|string|null: false|
### Association
- has_many :products
## sending_methodsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :products
## conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :products
## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||

### Association
has_many :products
## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :products