# UnofficialFreeeSdk::ManualJournalCreateParamsDetails

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**entry_side** | **String** | 貸借（貸方: credit, 借方: debit） | 
**tax_code** | **Integer** | 税区分コード | 
**account_item_id** | **Integer** | 勘定科目ID | 
**amount** | **Integer** | 取引金額（税込で指定してください） | 
**vat** | **Integer** | 消費税額（指定しない場合は自動で計算されます） | [optional] 
**partner_id** | **Integer** | 取引先ID | [optional] 
**partner_code** | **String** | 取引先コード | [optional] 
**item_id** | **Integer** | 品目ID | [optional] 
**section_id** | **Integer** | 部門ID | [optional] 
**tag_ids** | **Array&lt;Integer&gt;** | メモタグID | [optional] 
**segment_1_tag_id** | **Integer** | セグメント１ID | [optional] 
**segment_2_tag_id** | **Integer** | セグメント２ID | [optional] 
**segment_3_tag_id** | **Integer** | セグメント３ID | [optional] 
**description** | **String** | 備考 | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::ManualJournalCreateParamsDetails.new(entry_side: debit,
                                 tax_code: 1,
                                 account_item_id: 1,
                                 amount: 10800,
                                 vat: 800,
                                 partner_id: 1,
                                 partner_code: code001,
                                 item_id: 1,
                                 section_id: 1,
                                 tag_ids: null,
                                 segment_1_tag_id: 1,
                                 segment_2_tag_id: 1,
                                 segment_3_tag_id: 1,
                                 description: 備考)
```


