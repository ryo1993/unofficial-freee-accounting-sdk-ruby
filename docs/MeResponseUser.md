# UnofficialFreeeSdk::MeResponseUser

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | ユーザーID | 
**email** | **String** | メールアドレス | 
**display_name** | **String** | 表示ユーザー名 | [optional] 
**first_name** | **String** | 名 | [optional] 
**last_name** | **String** | 姓 | [optional] 
**first_name_kana** | **String** | 名（カナ） | [optional] 
**last_name_kana** | **String** | 姓（カナ） | [optional] 
**companies** | [**Array&lt;MeResponseUserCompanies&gt;**](MeResponseUserCompanies.md) |  | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::MeResponseUser.new(id: 1,
                                 email: contaxt@example.com,
                                 display_name: フリー太郎,
                                 first_name: 太郎,
                                 last_name: フリー,
                                 first_name_kana: タロウ,
                                 last_name_kana: フリー,
                                 companies: null)
```


