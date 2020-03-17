class UserAdress < ApplicationRecord
  validates :first_name,presence:true,format: {with:/\A[ぁ-んァ-ン一-龥]/}
  validates :last_name,presence:true,format: {with:/\A[ぁ-んァ-ン一-龥]/}
  validates :first_name_kana,presence:true,format: {with:/\A[ァ-ヶー－]+\z/}
  validates :last_name_kana,presence:true,format: {with:/\A[ァ-ヶー－]+\z/}
  validates :phone_number,length: {is:11},format:{with:/\A[0-9]+\z/}
  validates :postal_code,presence:true,length: {is:7}
  validates :prefectures,presence:true
  validates :city,presence:true
  validates :city_adress,presence:true
end
