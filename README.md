  # freemarket_sample_70c DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|mail|string|null: false|
|password|string|null: false|
|first-name|string|null: false|
|last-name|string|null: false|
|first-name-kana|string|null: false|
|last-name-kana|string|null: false|
|birthday|date|null: false|
|phone-number|integer|null: false|
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
|image_id|references|null: false,foreign_key:true|
|categorie_id|references|null: false,foreign_key:true|
|size_id|references|foreign_key:true|
|brand_id|references|foreign_key:true|
|condition_id|references|null: false,foreign_key:true|
|name|string|null: false|
|description|text|null: false|
|postage-burden|integer|null: false|
|sending-method-id|references|null: false,foreign_key:true|
|area_id|references|null: false,foreign_key:true|
|scheduled-sending-date|integer|null: false|
|price|integer|null: false|
|buyer_id|references|null: false,foreign_key: { to_table: :users }|
|buyed-time|integer||
|payment-method|string|null: false|
|payment-status|integer|null: false|
|recieving-status|string|null: false|
### Association
- has_many :images, dependent: :destroy
- accepts_nested_attributes_for :images, allow_destroy: true
- has_many :comments
- has_many :users
- has_one :seller_evaluation
- has_one :buyer_evaluation
- belongs_to :categorie
- belongs_to :brand, optional: true
- belongs_to :area
- belongs_to :size, optional: true
- belongs_to :condition
- belongs_to :sending_method

## user-adressesテーブル
|Column|Type|Options|
|------|----|-------|
|first-name|string|null: false, limit: 50|
|last-name|string|null: false, limit: 50|
|first-name-kana|string|null: false, limit: 50|
|last-name-kana|string|null: false, limit: 50|
|postal-code|integer|null: false|
|prefectures|string|null: false|
|city|string|null: false, limit: 20|
|city-adress|string|null: false, limit: 20|
|building|string|limit: 50|
|phone-number|integer|limit: 11|
### Association
- belongs_to :user, inverse_of: :user_address
- belongs_to :area

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
|comment|text|null: false|
### Association
- belongs_to :user
- belongs_to :product

## identity-informationsテーブル
|Column|Type|Options|
|------|----|-------|
|postal-code|integer|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|city-adress|string|null: false|
|building|string|null: false|
### Association
- belongs_to :area

## areasテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :products
- has_many :user_addresses
- has_many :identity_informations

## imageテーブル
|Column|Type|Options|
|------|----|-------|
|image-1|text|null: false|
|image-2|text||
|image-3|text||
|image-4|text||
|image-5|text||
|image-6|text||
|image-7|text||
|image-8|text||
|image-9|text||
|image-10|text||
### Association
- belongs_to :product

## credit-cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card-number|integer|null: false|
|deadline|integer|null: false|
|security-cord|integer|null: false|
### Association
- belongs_to :user

## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|value|string|null: false|
### Association
- has_many :products

## sending-methodsテーブル
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
|sub|string||
|sub-sub|string||
### Association
has_many :products
has_many :brands, through: :categorie_brands
has_many :categorie_brands

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :products
- has_many :categories, through: :categorie_brands
- has_many :categorie_brands

## categorie-brandsテーブル
|Column|Type|Options|
|------|----|-------|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
### Association
- belongs_to :categories
- belongs_to :brands

