# UnofficialFreeeSdk::TagResponseTag

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | タグID | 
**company_id** | **Integer** | 事業所ID | 
**name** | **String** | 名前(30文字以内) | 
**shortcut1** | **String** | ショートカット1 (255文字以内) | [optional] 
**shortcut2** | **String** | ショートカット2 (255文字以内) | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::TagResponseTag.new(id: 1,
                                 company_id: 1,
                                 name: メモタグ,
                                 shortcut1: MEMOTAG,
                                 shortcut2: 123)
```


