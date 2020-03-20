class Product < ApplicationRecord
  has_many :images
  belongs_to :category
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :images, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :postage_burden, presence: true
  validates :sending_method_id, presence: true
  validates :area_id, presence: true
  validates :scheduled_sending_date, presence: true
  validates :price, presence: true
end

