== README

# データベース設計  
## messages table  
|column|type|constraint|index|
|:---:|:---:|:---:|:---:|
|body|text|-|-|
|image|string|-|-|
|group_id|integer|foreign_key: true|○|
|user_id|integer|foreign_key :true|○|

## groups table  
|column|type|constraint|index|
|:---:|:---:|:---:|:---:|
|name|string|null:false|-|

## users table  
|column|type|constraint|index|
|:---:|:---:|:---:|:---:|
|name|string|null:false|○|

## group_users table  
|column|type|constraint|index|
|:---:|:---:|:---:|:---:|
|groups_id|integer|foreign_key: true|○|
|users_id|integer|foreign_key: true|○|
