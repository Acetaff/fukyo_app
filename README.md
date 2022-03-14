# テーブル設計

## users テーブル

| Column             | Type       | Options                   |
| ------------------ | ---------- | ------------------------- |
| fukyo_say          | string     | null: false  unique: true |
| profile            | string     | null: false               |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false               |


## Association

- has_many :fukyos
- has_many :comments
- has_many :relationships, class_name: "Relationship"
- has_many :reverse_of_relationships, class_name: "Relationship"


## Relationship テーブル

| Colum      | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| follower   | references | null: false, foreign_key: true |
| followed   | references | null: false, foreign_key: true |

## Association

- belongs_to :follower, class_name: "User"
- belongs_to :followed, class_name: "User"



## fukyos テーブル

| Colum           | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| title           | string     | null: false                    |
| f_text          | text       | null: false                    |
| f_url           | string     | null: false                    |
| user            | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- has_many :comment
- has_many :fukyo_tags
- has_many :tags, through: :fukyo_tags


## fukyo_tags テーブル

| Colum      | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| fukyo      | references | null: false, foreign_key: true |
| tag        | references | null: false, foreign_key: true |

## Association

- belongs_to :fukyo
- belongs_to :tag


## tags テーブル

| Colum      | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| tags_name  | string     | null: false, uniqueness: true  |

## Association

- has_many :fukyo_tags
- has_many :fukyos, though: :fukyo_tags

## comments テーブル

| Colum      | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| c_text     | string     | null, false                    |
| user       | references | null: false, foreign_key: true |
| fukyo      | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :fukyo