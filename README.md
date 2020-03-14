## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, foreign_key: true|
|age|integer||
|gender|string||
|email|text|null: false, foreign_key: true|
|password|text|null: false|
|iamge|string||
|text|text||

### Association
- has many :communities, through::communitiy_users
- has_many :messages
- has_many :comments
- has_many :tags throughh::user_tags


## communitiesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, foreign_key: true|
|iamge|string||

### Association
- has_many :users, through::community_user
- has_many :messages
- has_many :tags
- has_many :boards

## community-usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|community_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|community_id|reference|null: false, foreign_key: true|
|image|string||
|text|text||

### Association
- belongs_to :group
- belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|community_id|reference|null: false, foreign_key: true|
|image|string||
|text|text||


### Association
- belongs_to :user
- belongs_to :bords

## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|community_id|reference|null: false, foreign_key: true|
|image|string||
|text|text||

### Association
- belongs_to :group
- has_many: user

## community_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|community_id|reference|null: false, foreign_key: true|
|image|string||
|text|text||

## user_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|community_id|reference|null: false, foreign_key: true|
|image|string||
|text|text||

### Association
- belongs_to :group
- has_many: user

## boardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|community_id|reference|null: false, foreign_key: true|
|image|string||
|text|text||

### Association
- belongs_to :group
- has_many: user