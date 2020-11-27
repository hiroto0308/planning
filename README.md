# Sports planning

## サービス概要

![](https://i.gyazo.com/d17bf33711541df9c858b53129b39893.jpg )

社会人において、出会いというのは中々ある物ではないです。スポーツなどを通して実際にあった方がより時間をかけずに出会いや趣味が会う友人を作れると私は考えています。

「Sports planning」は、イベント投稿、参加する機能から、そのイベントを通して気に入った人とトークができるWEBサービス。

「Sports planning」を作ろうと思ったきっかけは、仕事で忙しい友人が、社会人になって出会いや運動する機会が減ってきたという悩みを解決しようと思い、スポーツイベント参加できる機能に、マッチングアプリのようにトーク機能を実装することにしました。

**テスト用アカウント**
アドレス: test@com
ID     : o09o09
**URL**
https://planning0308.herokuapp.com/

## 実装した機能
 - ユーザー管理機能
 - イベント投稿機能
 - イベント一覧表示機能
 - イベント詳細、編集、削除機能
 - イベント詳細コメント機能

## イベント一覧表示
![](https://i.gyazo.com/045d6a021d1acd19212c8840b14dc7bb.png )

イベントについて簡単な内容の表示

## イベント投稿機能
![]( https://i.gyazo.com/f88193e5137db03c14fde759372a40e0.png)

## イベント詳細機能
![]( https://i.gyazo.com/79aa337e684bca650e383a26a33f9d12.png)
編集、削除、コメント、購入機能の実装

## イベント詳細ページコメント機能
![]( https://i.gyazo.com/180440c3d2c6dc482c578b1660c5dd86.png)

## 実装予定の機能
- イベント購入機能
- マイページ機能
- チャット機能
- 検索機能

## er図
![]( https://i.gyazo.com/303d45bcb1abae8997af83fa5d7009c8.png)

## ローカルでの動作方法

```
% cd projects
% cd planning
```
- Ruby 2.6.5
- Rails  6.0.3.4

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
| time_all_id      | integer    | null: false       |
| start            | datetime   | null: false       |
| user             | references | foreign_key: true |
| time_start       | time       | null: false       |



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