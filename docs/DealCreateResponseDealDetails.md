# UnofficialFreeeSdk::DealCreateResponseDealDetails

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 取引行ID | 
**account_item_id** | **Integer** | 勘定科目ID | 
**tax_id** | **Integer** | 税区分ID（廃止予定） | [optional] 
**tax_code** | **Integer** | 税区分コード | 
**item_id** | **Integer** | 品目ID | [optional] 
**section_id** | **Integer** | 部門ID | [optional] 
**tag_ids** | **Array&lt;Integer&gt;** | メモタグID | [optional] 
**segment_1_tag_id** | **Integer** | セグメント１ID | [optional] 
**segment_2_tag_id** | **Integer** | セグメント２ID | [optional] 
**segment_3_tag_id** | **Integer** | セグメント３ID | [optional] 
**amount** | **Integer** | 取引金額 | 
**vat** | **Integer** | 消費税額 | 
**description** | **String** | 備考 | [optional] 
**entry_side** | **String** | 貸借（貸方: credit, 借方: debit） | 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::DealCreateResponseDealDetails.new(id: 11,
                                 account_item_id: 803,
                                 tax_id: 14,
                                 tax_code: 2,
                                 item_id: 501,
                                 section_id: 1,
                                 tag_ids: [1,2,3],
                                 segment_1_tag_id: 1,
                                 segment_2_tag_id: 1,
                                 segment_3_tag_id: 1,
                                 amount: 5250,
                                 vat: 250,
                                 description: 備考,
                                 entry_side: debit)
```


