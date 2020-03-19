# UnofficialFreeeSdk::RenewCreateParamsDetails

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account_item_id** | **Integer** | 勘定科目ID | 
**tax_code** | **Integer** | 税区分コード | 
**amount** | **Integer** | 取引金額（税込で指定してください） | 
**vat** | **Integer** | 消費税額（指定しない場合は自動で計算されます） | [optional] 
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

instance = UnofficialFreeeSdk::RenewCreateParamsDetails.new(account_item_id: 1,
                                 tax_code: 1,
                                 amount: 1080,
                                 vat: 80,
                                 item_id: 1,
                                 section_id: 1,
                                 tag_ids: [1,2,3],
                                 segment_1_tag_id: 1,
                                 segment_2_tag_id: 1,
                                 segment_3_tag_id: 1,
                                 description: 備考)
```


