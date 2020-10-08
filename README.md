# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birthday        | date   | null: false |


### Association

- has_many :items
- has_one :credit_cards
- has_one :shipping_address

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| image             | string     | null: false                    |
| name              | string     | null: false                    |
| description       | text       | null: false                    |
| category          | integer    | null: false                    |
| condition         | integer    | null: false                    |
| shipping_address  | integer    | null: false                    |
| shipping_from     | integer    | null: false                    |
| preparation_day   | integer    | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :users

## credit_cards テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card_number      | string     | null: false                    |
| expiration_year  | string     | null: false                    |
| expiration_month | string     | null: false                    |
| security_code    | string     | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :users

## shipping_address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :users