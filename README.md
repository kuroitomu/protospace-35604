# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column      | Type       | Options                        |
| ---------   | ---------- | ------------------------------ |
| email       | string     | null: false, foreign_key: true |
| password    | string     | null: false, foreign_key: true |
| name        | string     | null: false, foreign_key: true |
| profile     | text       | null: false, foreign_key: true |
| occupation  | text       | null: false, foreign_key: true |
| position    | text       | null: false, foreign_key: true |

### Association
- belongs_to :room
- belongs_to :user

## prototypes テーブル

| Column      | Type          | Options                        |
| ----------- | ------------- | ------------------------------ |
| title       | string        | null: false, foreign_key: true |
| catch_copy  | text          | null: false, foreign_key: true |
| concept     | text          | null: false, foreign_key: true |
| image       | ActiveStorage |                                |
| user        | references    |                                |


## comments テーブル

| Column    | Type          | Options                        |
| --------- | ------------- | ------------------------------ |
| text      | text          | null: false, foreign_key: true |
| user      | references    |                                |
| prototype | references    |                                |
