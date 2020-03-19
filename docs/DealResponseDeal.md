# UnofficialFreeeSdk::DealResponseDeal

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 取引ID | 
**company_id** | **Integer** | 事業所ID | 
**issue_date** | **String** | 発生日 (yyyy-mm-dd) | 
**due_date** | **String** | 支払期日 (yyyy-mm-dd) | [optional] 
**amount** | **Integer** | 金額 | 
**due_amount** | **Integer** | 支払金額 | [optional] 
**type** | **String** | 収支区分 (収入: income, 支出: expense) | [optional] 
**partner_id** | **Integer** | 取引先ID | 
**partner_code** | **String** | 取引先コード | [optional] 
**ref_number** | **String** | 管理番号 | [optional] 
**status** | **String** | 決済状況 (未決済: unsettled, 完了: settled) | 
**details** | [**Array&lt;DealCreateResponseDealDetails&gt;**](DealCreateResponseDealDetails.md) | 取引の明細行 | [optional] 
**renews** | [**Array&lt;DealResponseDealRenews&gt;**](DealResponseDealRenews.md) | 取引の+更新行 | [optional] 
**payments** | [**Array&lt;DealCreateResponseDealPayments&gt;**](DealCreateResponseDealPayments.md) | 取引の支払行 | [optional] 
**receipts** | [**Array&lt;DealResponseDealReceipts&gt;**](DealResponseDealReceipts.md) | 証憑ファイル | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::DealResponseDeal.new(id: 101,
                                 company_id: 1,
                                 issue_date: 2013-01-01,
                                 due_date: 2013-02-28,
                                 amount: 5250,
                                 due_amount: 0,
                                 type: expense,
                                 partner_id: 201,
                                 partner_code: code001,
                                 ref_number: 123-456,
                                 status: settled,
                                 details: null,
                                 renews: null,
                                 payments: null,
                                 receipts: null)
```


