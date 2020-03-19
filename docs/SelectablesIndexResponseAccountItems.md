# UnofficialFreeeSdk::SelectablesIndexResponseAccountItems

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 勘定科目ID | 
**name** | **String** | 勘定科目 | [optional] 
**desc** | **String** | 勘定科目の説明 | [optional] 
**help** | **String** | 勘定科目の説明（詳細） | [optional] 
**shortcut** | **String** | ショートカット | [optional] 
**default_tax** | [**SelectablesIndexResponseDefaultTax**](SelectablesIndexResponseDefaultTax.md) |  | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::SelectablesIndexResponseAccountItems.new(id: 1,
                                 name: 交際費,
                                 desc: 福利厚生以外の飲食費,
                                 help: null,
                                 shortcut: KOUSAI,
                                 default_tax: null)
```


