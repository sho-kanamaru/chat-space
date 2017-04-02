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

# アソシエーション  
class Message < ActiveRecord::Base  
    belongs_to :user  
    belongs_to :group  
end  
  
class Group < ActiveRecord::Base  
    has_many :messages  
    has_many :group_users  
    has_many :users, through: :group_users  
end  

class User < ActiveRecord::Base  
    has_many :messages  
    has_many :group_users  
    has_many :groups, through: :group_users  
end  
  
class GroupUser < ActiveRecord::Base  
    belongs_to :user  
    belongs_to :group  
end  
