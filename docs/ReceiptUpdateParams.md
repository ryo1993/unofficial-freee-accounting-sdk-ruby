# UnofficialFreeeSdk::ReceiptUpdateParams

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**company_id** | **Integer** | 事業所ID | 
**description** | **String** | メモ (255文字以内) | [optional] 
**issue_date** | **String** | 取引日 (yyyy-mm-dd) | 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::ReceiptUpdateParams.new(company_id: 1,
                                 description: メモ,
                                 issue_date: 2018-01-01)
```


