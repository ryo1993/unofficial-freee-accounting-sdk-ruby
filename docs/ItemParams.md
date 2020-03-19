# UnofficialFreeeSdk::ItemParams

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**company_id** | **Integer** | 事業所ID | 
**name** | **String** | 品目名 (30文字以内) | 
**shortcut1** | **String** | ショートカット１ (20文字以内) | [optional] 
**shortcut2** | **String** | ショートカット２ (20文字以内) | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::ItemParams.new(company_id: 1,
                                 name: 新しい品目,
                                 shortcut1: NEWITEM,
                                 shortcut2: 202)
```


