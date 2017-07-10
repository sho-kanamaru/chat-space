== README

# データベース設計  
## messages table  
belongs_to :user  
belongs_to :group  

|column|type|constraint|index|
|:---:|:---:|:---:|:---:|
|body|text|-|-|
|image|string|-|-|
|group_id|integer|foreign_key: true|-|
|user_id|integer|foreign_key :true|-|

## groups table  
has_many :messages  
has_many :groups_users  
has_many :users, through: :groups_users  

|column|type|constraint|index|
|:---:|:---:|:---:|:---:|
|name|string|null:false,unique|-|

## users table  
has_many :messages  
has_many :groups_users  
has_many :groups, through: :groups_users  

|column|type|constraint|index|
|:---:|:---:|:---:|:---:|
|name|string|null:false,unique|○|

## groups_users table  
belongs_to :user  
belongs_to :group  

|column|type|constraint|index|
|:---:|:---:|:---:|:---:|
|groups_id|integer|foreign_key: true|-|
|users_id|integer|foreign_key: true|-|

