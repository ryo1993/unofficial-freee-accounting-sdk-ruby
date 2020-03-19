# UnofficialFreeeSdk::TaxResponseTax

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**code** | **Integer** | 税区分コード | 
**name** | **String** | 税区分名 | 
**name_ja** | **String** | 税区分名（日本語表示用） | 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::TaxResponseTax.new(code: 21,
                                 name: sales_with_tax,
                                 name_ja: 課税売上)
```


