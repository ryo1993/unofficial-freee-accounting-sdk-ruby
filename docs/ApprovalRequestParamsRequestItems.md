# UnofficialFreeeSdk::ApprovalRequestParamsRequestItems

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 項目ID | [optional] 
**type** | **String** | 項目タイプ(single_line: 自由記述形式 1行, multi_line: 自由記述形式 複数行, select: プルダウン, date: 日付, amount: 金額, receipt: 添付ファイル) | [optional] 
**value** | **String** | 項目の値 (項目タイプによって入力可能な値が異なります。詳細は注意点をご確認ください） | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::ApprovalRequestParamsRequestItems.new(id: 1,
                                 type: null,
                                 value: 申請理由)
```


