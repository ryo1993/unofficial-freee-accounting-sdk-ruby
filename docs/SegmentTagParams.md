# UnofficialFreeeSdk::SegmentTagParams

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**company_id** | **Integer** | 事業所ID | 
**name** | **String** | セグメントタグ名 (30文字以内) | 
**description** | **String** | 備考 (30文字以内) | [optional] 
**shortcut1** | **String** | ショートカット１ (20文字以内) | [optional] 
**shortcut2** | **String** | ショートカット２ (20文字以内) | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::SegmentTagParams.new(company_id: 1,
                                 name: プロジェクトA,
                                 description: 備考,
                                 shortcut1: A,
                                 shortcut2: 123)
```


