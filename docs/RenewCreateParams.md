# UnofficialFreeeSdk::RenewCreateParams

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**company_id** | **Integer** | 事業所ID | 
**update_date** | **String** | 更新日 (yyyy-mm-dd) | 
**renew_target_id** | **Integer** | +更新対象行ID (details(取引の明細行), accruals(債権債務行), renewsのdetails(+更新の明細行)のIDを指定)  | 
**details** | [**Array&lt;RenewCreateParamsDetails&gt;**](RenewCreateParamsDetails.md) | +更新の明細行 | 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::RenewCreateParams.new(company_id: 1,
                                 update_date: 2014-01-01,
                                 renew_target_id: 1,
                                 details: null)
```


