# README

## usersテーブル

| Column              | Type   | Options     |
| ----------------    | ------ | ----------- |
| email               | string | null: false |
| encrypted_password  | string | null: false |
| nickname            | string | null: false |
| first_name_kanji    | string | null: false |
| last_name_kanji     | string | null: false |
| first_name_kana     | string | null: false |
| last_name_kana      | string | null: false |
| birth_day           | date   | null: false |

### Association
- has_many :items
- has_many :orders

## itemテーブル

| Column           | Type       | Options           |
| -----------------| ---------- | ----------------- |
| item_name        | string     | null: false       |
| item_explanation | text       | null: false       |
| price            | integer    | null: false       |
| category         | string     | null: false       |
| item_state       | string     | null: false       |
| delivery_fee     | string     | null: false       |
| delivery_area    | string     | null: false       |
| delivery_days    | date       | null: false       |
| user             | references | foreign_key:true  |

### Association

- belongs_to :user
- has_one :order

## orderテーブル

| Column           | Type       | Options           |
| -----------------| ---------- | ----------------- |
| user             | references | foreign_key:true  |

### Association

belongs_to :user
has_one :address

## addressテーブル

| Column           | Type       | Options           |
| -----------------| ---------- | ----------------- |
| post_code        | integer    | null: false       |
| city             | string     | null: false       |
| address          | string     | null: false       |
| building_name    | string     |                   |
| phone_number     | integer    | unique: true      |


### Association

belongs_to :order
