# UnofficialFreeeSdk::InvoiceResponseInvoiceTotalAmountPerVatRate

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**vat_5** | **Integer** | 税率5%の税込み金額合計 | 
**vat_8** | **Integer** | 税率8%の税込み金額合計 | 
**reduced_vat_8** | **Integer** | 軽減税率8%の税込み金額合計 | 
**vat_10** | **Integer** | 税率10%の税込み金額合計 | 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::InvoiceResponseInvoiceTotalAmountPerVatRate.new(vat_5: 0,
                                 vat_8: 108000,
                                 reduced_vat_8: 0,
                                 vat_10: 0)
```


