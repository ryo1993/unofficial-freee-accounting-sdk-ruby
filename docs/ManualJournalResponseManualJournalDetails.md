# UnofficialFreeeSdk::ManualJournalResponseManualJournalDetails

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 貸借行ID | 
**entry_side** | **String** | 貸借(貸方: credit, 借方: debit) | 
**account_item_id** | **Integer** | 勘定科目ID | 
**tax_code** | **Integer** | 税区分ID | 
**partner_id** | **Integer** | 取引先ID | 
**partner_name** | **String** | 取引先名 | 
**partner_code** | **String** | 取引先コード | [optional] 
**partner_long_name** | **String** | 正式名称（255文字以内） | 
**item_id** | **Integer** | 品目ID | 
**item_name** | **String** | 品目 | 
**section_id** | **Integer** | 部門ID | 
**section_name** | **String** | 部門 | 
**tag_ids** | **Array&lt;Integer&gt;** |  | 
**tag_names** | **Array&lt;String&gt;** |  | 
**segment_1_tag_id** | **Integer** | セグメント１ID | [optional] 
**segment_1_tag_name** | **Integer** | セグメント１ID | [optional] 
**segment_2_tag_id** | **Integer** | セグメント２ID | [optional] 
**segment_2_tag_name** | **Integer** | セグメント２ | [optional] 
**segment_3_tag_id** | **Integer** | セグメント３ID | [optional] 
**segment_3_tag_name** | **Integer** | セグメント３ | [optional] 
**amount** | **Integer** | 金額（税込で指定してください） | 
**vat** | **Integer** | 消費税額（指定しない場合は自動で計算されます） | 
**description** | **String** | 備考 | 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::ManualJournalResponseManualJournalDetails.new(id: 1,
                                 entry_side: credit,
                                 account_item_id: 1,
                                 tax_code: 1,
                                 partner_id: 1,
                                 partner_name: freee,
                                 partner_code: code001,
                                 partner_long_name: freee株式会社,
                                 item_id: 1,
                                 item_name: 会計freee,
                                 section_id: 1,
                                 section_name: 開発部,
                                 tag_ids: null,
                                 tag_names: null,
                                 segment_1_tag_id: 1,
                                 segment_1_tag_name: null,
                                 segment_2_tag_id: 1,
                                 segment_2_tag_name: null,
                                 segment_3_tag_id: 1,
                                 segment_3_tag_name: null,
                                 amount: 108000,
                                 vat: 8000,
                                 description: 備考)
```


