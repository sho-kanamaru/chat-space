== README

# Definition of Database  
## messages table  
|column|type|constraint|index|
|:---:|:---:|:---:|:---:|
|body|text|-|-|
|image|string|-|-|
|group_id|integer|foreign_key: true|○|
|user_id|integer|foreign_key :true|○|
