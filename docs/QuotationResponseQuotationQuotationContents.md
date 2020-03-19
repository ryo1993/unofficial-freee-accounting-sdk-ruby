# UnofficialFreeeSdk::QuotationResponseQuotationQuotationContents

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 見積内容ID | 
**order** | **Integer** | 順序 | 
**type** | **String** | 行の種類 | 
**qty** | **Float** | 数量 | 
**unit** | **String** | 単位 | 
**unit_price** | **Float** | 単価 | 
**amount** | **Integer** | 金額 | 
**vat** | **Integer** | 消費税額 | 
**reduced_vat** | **Boolean** | 軽減税率税区分（true: 対象、false: 対象外） | 
**description** | **String** | 備考 | 
**account_item_id** | **Integer** | 勘定科目ID | 
**account_item_name** | **String** | 勘定科目名 | 
**tax_code** | **Integer** | 税区分コード | 
**item_id** | **Integer** | 品目ID | 
**item_name** | **String** | 品目 | 
**section_id** | **Integer** | 部門ID | 
**section_name** | **String** | 部門 | 
**tag_ids** | **Array&lt;Integer&gt;** |  | 
**tag_names** | **Array&lt;String&gt;** |  | 
**segment_1_tag_id** | **Integer** | セグメント１ID | [optional] 
**segment_1_tag_name** | **String** | セグメント１ID | [optional] 
**segment_2_tag_id** | **Integer** | セグメント２ID | [optional] 
**segment_2_tag_name** | **String** | セグメント２ | [optional] 
**segment_3_tag_id** | **Integer** | セグメント３ID | [optional] 
**segment_3_tag_name** | **String** | セグメント３ | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::QuotationResponseQuotationQuotationContents.new(id: 1,
                                 order: 1,
                                 type: normal,
                                 qty: 1,
                                 unit: 個,
                                 unit_price: 1,
                                 amount: 108000,
                                 vat: 8000,
                                 reduced_vat: true,
                                 description: 備考,
                                 account_item_id: 1,
                                 account_item_name: 売上,
                                 tax_code: 1,
                                 item_id: 1,
                                 item_name: 会計freee,
                                 section_id: 1,
                                 section_name: 開発部,
                                 tag_ids: null,
                                 tag_names: null,
                                 segment_1_tag_id: 1,
                                 segment_1_tag_name: セグメント１,
                                 segment_2_tag_id: 1,
                                 segment_2_tag_name: セグメント２,
                                 segment_3_tag_id: 1,
                                 segment_3_tag_name: セグメント３)
```


