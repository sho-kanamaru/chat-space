== README

# データベース設計  
## messages table  
belongs_to :user belongs_to :group  

|column|type|constraint|index|
|:---:|:---:|:---:|:---:|
|body|text|-|-|
|image|string|-|-|
|group_id|integer|foreign_key: true|○|
|user_id|integer|foreign_key :true|○|

## groups table  
has_many :messages has_many :group_users has_many :users, through: :group_users

|column|type|constraint|index|
|:---:|:---:|:---:|:---:|
|name|string|null:false|-|

## users table  
has_many :messages has_many :group_users has_many :groups, through: :group_users  

|column|type|constraint|index|
|:---:|:---:|:---:|:---:|
|name|string|null:false|○|

## group_users table  
belongs_to :user belongs_to :group  

|column|type|constraint|index|
|:---:|:---:|:---:|:---:|
|groups_id|integer|foreign_key: true|○|
|users_id|integer|foreign_key: true|○|

