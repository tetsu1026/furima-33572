class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :item_state
    belongs_to_active_hash :delivery_fee
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :delivery_day
  
    belongs_to :user
    has_one :order
    has_one_attached :image

      
    validates :image, presence: true
    validates :name, presence: true, length: {maximum:40}

    validates :explanation, presence: true, length: {maximum:1000}

    validates :price, presence: true, format: { with: /\A[0-9]+\z/}, numericality: {greater_than: 299,less_than: 10000000}

    with_options numericality: { other_than: 1, message: 'Select'} do 
      validates :category_id
      validates :item_state_id
      validates :delivery_fee_id
      validates :prefecture_id
      validates :delivery_days_id
    end
end
