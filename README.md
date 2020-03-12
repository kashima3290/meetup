## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, foreign_key: true|
|password|text|null: false|
|email|text|null: false|
|iamge|string||
|text|text||

### Association
- has many :groups, through::groups_user
- has_many :messages
- has_many :comments
- has_many :boards


## communitiesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, foreign_key: true|
|email|text|null: false|
|iamge|string||

### Association
- has_many :users, through::community_user
- has_many :messages
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