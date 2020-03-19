# UnofficialFreeeSdk::SectionParams

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**company_id** | **Integer** | 事業所ID | 
**name** | **String** | 部門名 (30文字以内) | 
**long_name** | **String** | 正式名称 (255文字以内) | [optional] 
**shortcut1** | **String** | ショートカット１ (20文字以内) | [optional] 
**shortcut2** | **String** | ショートカット２ (20文字以内) | [optional] 
**parent_id** | **Integer** | 親部門ID (ビジネスプラン以上) | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::SectionParams.new(company_id: 1,
                                 name: 開発部門,
                                 long_name: xxxx開発部門,
                                 shortcut1: DEVELOPER,
                                 shortcut2: 123,
                                 parent_id: 101)
```


