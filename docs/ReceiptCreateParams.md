# UnofficialFreeeSdk::ReceiptCreateParams

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**company_id** | **Integer** | 事業所ID | 
**description** | **String** | メモ (255文字以内) | [optional] 
**issue_date** | **String** | 取引日 (yyyy-mm-dd) | [optional] 
**receipt** | **File** | 証憑ファイル | 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::ReceiptCreateParams.new(company_id: null,
                                 description: null,
                                 issue_date: null,
                                 receipt: null)
```


