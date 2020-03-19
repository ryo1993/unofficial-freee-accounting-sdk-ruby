# UnofficialFreeeSdk::QuotationUpdateParamsQuotationContents

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 見積内容ID | [optional] 
**order** | **Integer** | 順序 | 
**type** | **String** | 行の種類 | 
**qty** | **Float** | 数量 | [optional] 
**unit** | **String** | 単位 | [optional] 
**unit_price** | **Float** | 単価 (tax_entry_method: inclusiveの場合は税込価格、tax_entry_method: exclusiveの場合は税抜価格となります) | [optional] 
**vat** | **Integer** | 消費税額 | [optional] 
**description** | **String** | 備考 | [optional] 
**account_item_id** | **Integer** | 勘定科目ID | [optional] 
**tax_code** | **Integer** | 税区分ID | [optional] 
**item_id** | **Integer** | 品目ID | [optional] 
**section_id** | **Integer** | 部門ID | [optional] 
**tag_ids** | **Array&lt;Integer&gt;** |  | [optional] 
**segment_1_tag_id** | **Integer** | セグメント１ID | [optional] 
**segment_2_tag_id** | **Integer** | セグメント２ID | [optional] 
**segment_3_tag_id** | **Integer** | セグメント３ID | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::QuotationUpdateParamsQuotationContents.new(id: 1,
                                 order: 0,
                                 type: normal,
                                 qty: 1,
                                 unit: 個,
                                 unit_price: 1,
                                 vat: 8000,
                                 description: 備考,
                                 account_item_id: 1,
                                 tax_code: 1,
                                 item_id: 1,
                                 section_id: 1,
                                 tag_ids: null,
                                 segment_1_tag_id: 1,
                                 segment_2_tag_id: 1,
                                 segment_3_tag_id: 1)
```


