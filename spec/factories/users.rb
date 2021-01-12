FactoryBot.define do
  factory :user do
    nickname               {Faker::Name}
    email                  {Faker::Internet.free_email}
    password               {'test1234test'}
    password_confirmation  {password}
    first_name_kanji       {"山田"}
    last_name_kanji        {"太郎"}
    first_name_kana        {"ヤマダ"}
    last_name_kana         {"タロウ"}
    birth_day              {"2000-01-01"}

  end
end