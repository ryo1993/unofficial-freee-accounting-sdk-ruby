# UnofficialFreeeSdk::DealResponseDealRenews

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | +更新行ID | 
**update_date** | **String** | 更新日 (yyyy-mm-dd) | 
**renew_target_id** | **Integer** | +更新の対象行ID | 
**renew_target_type** | **String** | +更新の対象行タイプ | 
**details** | [**Array&lt;DealResponseDealDetails&gt;**](DealResponseDealDetails.md) | +更新の明細行一覧（配列） | 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::DealResponseDealRenews.new(id: 11,
                                 update_date: 2014-01-01,
                                 renew_target_id: 12,
                                 renew_target_type: detail,
                                 details: null)
```


