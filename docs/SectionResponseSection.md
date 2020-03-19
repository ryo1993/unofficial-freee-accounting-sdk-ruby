# UnofficialFreeeSdk::SectionResponseSection

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 部門ID | 
**name** | **String** | 部門名 (30文字以内) | 
**long_name** | **String** | 正式名称（255文字以内） | [optional] 
**company_id** | **Integer** | 事業所ID | 
**shortcut1** | **String** | ショートカット１ (20文字以内) | [optional] 
**shortcut2** | **String** | ショートカット２ (20文字以内) | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::SectionResponseSection.new(id: 1,
                                 name: 開発部門,
                                 long_name: 開発部門,
                                 company_id: 1,
                                 shortcut1: DEVELOPER,
                                 shortcut2: 123)
```


