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

    with_options numericality: { other_than: 1 } do 
      validates :category_id
      validates :item_state_id
      validates :delivery_fee_id
      validates :prefecture_id
      validates :delivery_days_id
    end
end
