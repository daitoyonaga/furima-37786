# README

## users テーブル

Things you may want to cover:
| Column   | Type   | Options     |
|----------|--------|-------------|
| name     | string | null: false               |
| email    | string | null: false, unique: true |
| password | string | null: false |

### Association

- has_many :items
- has_many :parchase_records

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ | 
| title           | string     | null: false                    |
| content         | text       | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_record

## purchase_records テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_information

## shipping_information テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | integer    | null: false                    |
| prefectures      | string     | null: false                    |
| municipalities   | string     | null: false                    |
| address          | integer    | null: false                    |
| building_name    | string     |                                |
| phone_number     | integer    | null: false                    |
| purchase_records | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record