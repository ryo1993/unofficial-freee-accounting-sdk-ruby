# UnofficialFreeeSdk::TagParams

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**company_id** | **Integer** | 事業所ID | 
**name** | **String** | メモタグ名 (30文字以内) | 
**shortcut1** | **String** | メモタグ検索用 (20文字以内) | [optional] 
**shortcut2** | **String** | メモタグ検索用 (20文字以内) | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::TagParams.new(company_id: 1,
                                 name: メモタグ1,
                                 shortcut1: tag1,
                                 shortcut2: t1)
```


