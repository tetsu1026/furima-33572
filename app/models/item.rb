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

    with_options presence: true do
      validates :image
      validates :name, length: {maximum:40}
      validates :explanation, length: {maximum:1000}
      validates :price, format: { with: /\A[0-9]+\z/}, numericality: {greater_than: 299,less_than: 10000000}
    end

    with_options numericality: { other_than: 1, message: 'Select'} do 
      validates :category_id
      validates :item_state_id
      validates :delivery_fee_id
      validates :prefecture_id
      validates :delivery_days_id
    end
end
