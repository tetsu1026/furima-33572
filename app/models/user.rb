class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には半角の英字数字の両方を含めて設定してください'

  validates :nickname,         presence: true
  validates :birth_day,        presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
    validates :first_name_kanji, presence: true
    validates :last_name_kanji,  presence: true
  end
  
  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: '全角(カタカナ)を使用してください'} do
    validates :first_name_kana,  presence: true
    validates :last_name_kana,   presence: true
  end
   
  has_many :items
  has_many :orders

end
