FactoryBot.define do
  factory :order_address do
    post_code              {"123-4567"}
    prefecture_id          {2}
    city                   {"横浜市"}
    address                {"横浜1-2-3"}
    building_name          {"横浜ビル"}
    phone_number           {"1234567890"}    
    user_id                {1}
    item_id                {2}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
