# UnofficialFreeeSdk::SegmentTagResponseSegmentTag

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | セグメントタグID | 
**name** | **String** | セグメントタグ名 | 
**description** | **String** | 備考 | 
**shortcut1** | **String** | ショートカット１ (20文字以内) | 
**shortcut2** | **String** | ショートカット２ (20文字以内) | 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::SegmentTagResponseSegmentTag.new(id: 1,
                                 name: プロジェクトA,
                                 description: 備考,
                                 shortcut1: A,
                                 shortcut2: 123)
```


