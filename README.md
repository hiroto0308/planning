# テーブル設計

## users テーブル

| column             | type    | options                   |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| nickname           | string  | null: false               |
| first_name         | string  | null: false               |
| family_name        | string  | null: false               |
| first_name_kana    | string  | null: false               |
| family_name_kana   | string  | null: false               |
| birthday           | date    | null: false               |
| gender             | integer | null: false               |





### Association 

- has_many : events
- has_many : purchases
- has_many : comments

## eventsテーブル

| column           | type       | options           |
| ---------------- | ---------- | ----------------- |
| product          | string     | null: false       |
| introduction     | text       | null: false       |
| category_id      | integer    | null: false       |
| price            | integer    | null: false       |
| delivery_area_id | integer    | null: false       |
| time_id          | integer    | null: false       |
| end              | datetime   | null: false       |
| start            | datetime   | null: false       |
| user             | references | foreign_key: true |


### Association

- belongs_to :user
- has_one    :purchase
- has_many   :comments

## purchasesテーブル

| column | type       | options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |



### Association

- belongs_to :user
- belongs_to :event
- has_one    :address

## addressesテーブル

| column           | type       | options           |
| ---------------- | ---------- | ----------------- |
| post_code        | string     | null: false       |
| delivery_area_id | integer    | null: false       |
| city             | string     | null: false       |
| address          | string     | null: false       |
| buliding_name    | string     |                   |
| phone            | string     | null: false       |
| purchase         | references | foreign_key: true |



### Association

- belongs_to :purchase

## commentsテーブル

| column | type       | options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |
| text   | string     | null: false       |

### Association

- belongs_to :user
- belongs_to :event