# UnofficialFreeeSdk::DealCreateParamsDetails

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**tax_code** | **Integer** | 税区分コード | [optional] 
**tax_id** | **Integer** | 税区分ID（廃止予定。上記tax_codeを使用してください。tax_code, tax_idはどちらかの指定が必須です。） | [optional] 
**account_item_id** | **Integer** | 勘定科目ID | 
**amount** | **Integer** | 取引金額（税込で指定してください） | 
**item_id** | **Integer** | 品目ID | [optional] 
**section_id** | **Integer** | 部門ID | [optional] 
**tag_ids** | **Array&lt;Integer&gt;** | メモタグID | [optional] 
**segment_1_tag_id** | **Integer** | セグメント１ID | [optional] 
**segment_2_tag_id** | **Integer** | セグメント２ID | [optional] 
**segment_3_tag_id** | **Integer** | セグメント３ID | [optional] 
**description** | **String** | 備考 | [optional] 
**vat** | **Integer** | 消費税額（指定しない場合は自動で計算されます） | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::DealCreateParamsDetails.new(tax_code: 1,
                                 tax_id: 1,
                                 account_item_id: 1,
                                 amount: 1,
                                 item_id: 1,
                                 section_id: 1,
                                 tag_ids: null,
                                 segment_1_tag_id: 1,
                                 segment_2_tag_id: 1,
                                 segment_3_tag_id: 1,
                                 description: 備考,
                                 vat: 800)
```


