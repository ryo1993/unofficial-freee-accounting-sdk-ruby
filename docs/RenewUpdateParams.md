# UnofficialFreeeSdk::RenewUpdateParams

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**company_id** | **Integer** | 事業所ID | 
**update_date** | **String** | 更新日 (yyyy-mm-dd) | 
**details** | [**Array&lt;RenewUpdateParamsDetails&gt;**](RenewUpdateParamsDetails.md) | +更新の明細行 | 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::RenewUpdateParams.new(company_id: 1,
                                 update_date: 2014-01-01,
                                 details: null)
```


