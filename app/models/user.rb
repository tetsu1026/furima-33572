class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  #validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :nickname,         presence: true
  validates :first_name_kanji, presence: true
  validates :last_name_kanji,  presence: true
  validates :first_name_kana,  presence: true
  validates :last_name_kana,   presence: true
  validates :birth_day,        presence: true

  has_many :items
  has_many :orders

end
