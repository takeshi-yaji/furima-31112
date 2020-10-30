# テーブル設計

## usersテーブル

| Column              | Type                 | Options                       |
| ------------------- | -------------------- | ----------------------------- |
| nickname            | string               | null: false, unique: true     |
| email               | string               | null: false, unique: true     |
| encrypted_password  | string               | null: false                   |
| first_name          | string               | null: false                   |
| last_name           | string               | null: false                   |
| first_name_kana     | string               | null: false                   |
| last_name_kana      | string               | null: false                   |
| birthday            | date                 | null: false                   |


### Association
- has_many :items
- has_many :purchases
- has_many :comments


## itemsテーブル

| Column              | Type              | Options                              |
| ------------------- | ----------------- | ------------------------------------ |
| name                | text              | null: false                          |
| content             | text              | null: false                          |
| category_id         | integer           | null: false                          |
| status_id           | integer           | null: false                          |
| charges_id          | integer           | null: false                          |
| area_id             | integer           | null: false                          |
| price_id            | integer           | null: false                          |
| days_id             | integer           | null: false                          |
| user                | references        | null: false, foreign_key: true       |


### Association
- belongs_to :user
- has_one :address
- has_many :comments



## buyersテーブル

| Column          | Type         | Options                         |
| --------------- | ------------ | ------------------------------- |
| user            | references   | null: false, foreign_key: true  |
| item            | references   | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addressテーブル

| Column          | Type         | Options                         |
| --------------- | ------------ | ------------------------------- |
| post_id         | integer      | null: false                     |
| prefecture_id   | integer      | null: false                     |
| municipality    | text         | null: false                     |
| address         | string       | null: false                     |
| building        | string       |                                 |
| phone           | integer      | null: false                     |

### Association
- belongs_to :purchase


## commentsテーブル

| Column       | Type          | Options                          | 
| ------------ | ------------- | -------------------------------- |
| text         | text          | null: false                      | 
| user         | references    | null: false, foreign_key: true   |
| item         | references    | null: false, foreign_key: true   |


### Association
- belongs_to :user
- belongs_to :item