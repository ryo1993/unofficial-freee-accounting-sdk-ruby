# UnofficialFreeeSdk::DealResponseDealDetails

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | +更新の明細行ID | 
**entry_side** | **String** | 貸借(貸方: credit, 借方: debit) | 
**account_item_id** | **Integer** | 勘定科目ID | 
**tax_code** | **Integer** | 税区分コード | 
**item_id** | **Integer** | 品目ID | [optional] 
**section_id** | **Integer** | 部門ID | [optional] 
**tag_ids** | **Array&lt;Integer&gt;** |  | 
**segment_1_tag_id** | **Integer** | セグメント１ID | [optional] 
**segment_2_tag_id** | **Integer** | セグメント２ID | [optional] 
**segment_3_tag_id** | **Integer** | セグメント３ID | [optional] 
**amount** | **Integer** | 金額（税込で指定してください） | 
**vat** | **Integer** | 消費税額（指定しない場合は自動で計算されます） | 
**description** | **String** | 備考 | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::DealResponseDealDetails.new(id: 1,
                                 entry_side: debit,
                                 account_item_id: 1,
                                 tax_code: 1,
                                 item_id: 1,
                                 section_id: 1,
                                 tag_ids: null,
                                 segment_1_tag_id: 1,
                                 segment_2_tag_id: 1,
                                 segment_3_tag_id: 1,
                                 amount: 108000,
                                 vat: 8000,
                                 description: 備考)
```


