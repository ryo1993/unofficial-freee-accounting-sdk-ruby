# UnofficialFreeeSdk::ItemResponseItem

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 品目ID | 
**company_id** | **Integer** | 事業所ID | 
**name** | **String** | 品目名 (30文字以内) | 
**shortcut1** | **String** | ショートカット１ (20文字以内) | [optional] 
**shortcut2** | **String** | ショートカット２ (20文字以内) | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::ItemResponseItem.new(id: 101,
                                 company_id: 1,
                                 name: タクシー代,
                                 shortcut1: TAXI,
                                 shortcut2: 201)
```


