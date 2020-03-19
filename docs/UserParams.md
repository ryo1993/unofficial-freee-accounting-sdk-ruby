# UnofficialFreeeSdk::UserParams

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**display_name** | **String** | 表示名 (20文字以内) | [optional] 
**first_name** | **String** | 氏名（名） (20文字以内) | [optional] 
**last_name** | **String** | 氏名（姓） (20文字以内) | [optional] 
**first_name_kana** | **String** | 氏名（カナ・名） (20文字以内) | [optional] 
**last_name_kana** | **String** | 氏名（カナ・姓） (20文字以内) | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::UserParams.new(display_name: 山田太郎,
                                 first_name: 太郎,
                                 last_name: 山田,
                                 first_name_kana: タロウ,
                                 last_name_kana: ヤマダ)
```


