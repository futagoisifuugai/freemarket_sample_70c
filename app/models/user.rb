class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  validates :password,presence:true,format: {with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}+\z/i}
  validates :nickname,presence:true
  validates :first_name,presence:true,format: {with:/\A[ぁ-んァ-ン一-龥]/}
  validates :last_name,presence:true,format: {with:/\A[ぁ-んァ-ン一-龥]/}
  validates :first_name_kana,presence:true,format: {with:/\A[ァ-ヶー－]+\z/}
  validates :last_name_kana,presence:true,format: {with:/\A[ァ-ヶー－]+\z/}
  validates :email,presence:true,uniqueness: true,format: {with:/\A\S+@\S+\.\S+\z/}
end
