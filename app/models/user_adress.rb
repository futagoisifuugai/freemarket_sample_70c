class UserAdress < ApplicationRecord
  validates :first_name,format: {with:/\A[ぁ-んァ-ン一-龥]/}
  validates :last_name,format: {with:/\A[ぁ-んァ-ン一-龥]/}
  validates :first_name_kana,format: {with:/\A[ァ-ヶー－]+\z/}
  validates :last_name_kana,format: {with:/\A[ァ-ヶー－]+\z/}
  validates :phone_number,length: {is:11},format:{with:/\A[0-9]+\z/}
  validates :postal_code,length: {is:7}
end
