# README

## userテーブル

| Column              | Type   | Options                  |
| ----------------    | ------ | ------------------------ |
| email               | string | null: false,unique: true |
| encrypted_password  | string | null: false              |
| nickname            | string | null: false              |
| first_name_kanji    | string | null: false              |
| last_name_kanji     | string | null: false              |
| first_name_kana     | string | null: false              |
| last_name_kana      | string | null: false              |
| birth_day           | date   | null: false              |


### Association
- has_many :items
- has_many :orders

## itemテーブル

| Column           | Type       | Options           |
| -----------------| ---------- | ----------------- |
| name             | string     | null: false       |
| explanation      | text       | null: false       |
| price            | integer    | null: false       |
| category_id      | integer    | null: false       |
| item_state_id    | integer    | null: false       |
| delivery_fee_id  | integer    | null: false       |
| prefecture_id    | integer    | null: false       |
| delivery_day_id  | integer    | null: false       |
| user             | references | foreign_key:true  |

### Association

- belongs_to :user
- has_one :order

## orderテーブル

| Column           | Type       | Options           |
| -----------------| ---------- | ----------------- |
| user             | references | foreign_key:true  |
| item             | references | foreign_key:true  |


### Association

belongs_to :user
belongs_to :item
has_one :address

## addressテーブル

| Column           | Type       | Options                       |
| -----------------| ---------- | ----------------------------- |
| post_code        | string     | null: false                   |
| prefecture_id    | integer    | null: false                   |
| city             | string     | null: false                   |
| address          | string     | null: false                   |
| building_name    | string     |                               |
| phone_number     | string     | null: false,unique: true      |
| order            | references | foreign_key:true              |


### Association

belongs_to :order
