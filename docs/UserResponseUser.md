# UnofficialFreeeSdk::UserResponseUser

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | ユーザーID | 
**email** | **String** | メールアドレス | 
**display_name** | **String** | 表示名 | [optional] 
**first_name** | **String** | 氏名（名） | [optional] 
**last_name** | **String** | 氏名（姓） | [optional] 
**first_name_kana** | **String** | 氏名（カナ・名） | [optional] 
**last_name_kana** | **String** | 氏名（カナ・姓） | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::UserResponseUser.new(id: 1,
                                 email: example@freee.co.jp,
                                 display_name: 山田太郎,
                                 first_name: 太郎,
                                 last_name: 山田,
                                 first_name_kana: タロウ,
                                 last_name_kana: ヤマダ)
```


