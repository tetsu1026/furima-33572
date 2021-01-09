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
- has_one :order

## itemテーブル

| Column           | Type       | Options           |
| -----------------| ---------- | ----------------- |
| item_name        | string     | null: false       |
| item_explanation | text       | null: false       |
| price            | integer    | null: false       |
| user             | references | foreign_key:true  |

### Association

- belongs_to :user

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
