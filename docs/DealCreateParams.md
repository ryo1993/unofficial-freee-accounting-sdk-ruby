# UnofficialFreeeSdk::DealCreateParams

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**issue_date** | **String** | 発生日 (yyyy-mm-dd) | 
**type** | **String** | 収支区分 (収入: income, 支出: expense) | 
**company_id** | **Integer** | 事業所ID | 
**due_date** | **String** | 支払期日(yyyy-mm-dd) | [optional] 
**partner_id** | **Integer** | 取引先ID | [optional] 
**partner_code** | **String** | 取引先コード | [optional] 
**ref_number** | **String** | 管理番号 | [optional] 
**details** | [**Array&lt;DealCreateParamsDetails&gt;**](DealCreateParamsDetails.md) |  | 
**payments** | [**Array&lt;DealCreateParamsPayments&gt;**](DealCreateParamsPayments.md) | 支払行一覧（配列）：未指定の場合、未決済の取引を作成します。 | [optional] 
**receipt_ids** | **Array&lt;Integer&gt;** | 証憑ファイルID（配列） | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::DealCreateParams.new(issue_date: 2013-01-01,
                                 type: income,
                                 company_id: 1,
                                 due_date: 2018-12-31,
                                 partner_id: 1,
                                 partner_code: code001,
                                 ref_number: 1,
                                 details: null,
                                 payments: null,
                                 receipt_ids: null)
```


