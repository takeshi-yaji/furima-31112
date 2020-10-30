# テーブル設計

## usersテーブル

| Column              | Type           | Options                       |
| ------------------- | ---------------| ----------------------------- |
| nickname            | string         | null: false, unique: true     |
| email               | string         | null: false, unique: true     |
| password            | string         | null: false                   |
| first_name          | string         | null: false                   |
| last_name           | string         | null: false                   |
| first_name_kana     | string         | null: false                   |
| last_name_kana      | string         | null: false                   |
| birth_day_yy        | integer        | null: false                   |
| birth_day_mm        | integer        | null: false                   |
| birth_day_dd        | integer        | null: false                   |


### Association
- has_many :items
- has_many :purchases
- has_many :comments


## itemsテーブル

| Column              | Type              | Options                              |
| ------------------- | ----------------- | ------------------------------------ |
| name                | text              | null: false                          |
| content             | text              | null: false                          |
| category            | string            | null: false                          |
| status              | string            | null: false                          |
| charges             | integer           | null: false                          |
| area                | string            | null: false                          |
| price               | integer           | null: false                          |
| days                | string            | null: false                          |
| users_id            | references        | null: false, foreign_key: true       |


### Association
- belongs_to :user
- has_one :address
- has_many :comments



## buyersテーブル

| Column          | Type         | Options                         |
| --------------- | ------------ | ------------------------------- |
| buyer_id        | integer      | null: false
| user_id         | references   | null: false, foreign_key: true  |
| item_id         | references   | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addressテーブル

| Column          | Type         | Options                         |
| --------------- | ------------ | ------------------------------- |
| post_id         | integer      | null: false                     |
| prefecture      | string       | null: false                     |
| municipality    | text         | null: false                     |
| address         | string       | null: false                     |
| building        | string       | null: false                     |
| phone           | integer      | null: false                     |

### Association
- belongs_to :purchase


## commentsテーブル

| Column       | Type          | Options                          | 
| ------------ | ------------- | -------------------------------- |
| text         | text          | null: false                      | 
| user_id      | references    | null: false, foreign_key: true   |
| item_id      | references    | null: false, foreign_key: true   |


### Association
- belongs_to :user
- belongs_to :item