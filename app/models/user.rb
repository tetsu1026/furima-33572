class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

  validates :nickname,         presence: true
  validates :birth_day,        presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
    validates :first_name_kanji, presence: true
    validates :last_name_kanji,  presence: true
  end
  
  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/ } do
    validates :first_name_kana,  presence: true
    validates :last_name_kana,   presence: true
  end
   
  has_many :items
  has_many :orders

end
