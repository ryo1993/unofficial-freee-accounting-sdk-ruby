# UnofficialFreeeSdk::ExpenseApplicationUpdateParamsExpenseApplicationLines

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 経費申請の項目行ID: 既存項目行を更新する場合に指定します。IDを指定しない項目行は、新規行として扱われ追加されます。また、expense_application_linesに含まれない既存の項目行は削除されます。更新後も残したい行は、必ず経費申請の項目行IDを指定してexpense_application_linesに含めてください。 | [optional] 
**transaction_date** | **String** | 日付 (yyyy-mm-dd) | [optional] 
**description** | **String** | 内容 (250文字以内) | [optional] 
**amount** | **Integer** | 金額 | [optional] 
**expense_application_line_template_id** | **Integer** | 経費科目ID | [optional] 
**receipt_id** | **Integer** | 証憑ID | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::ExpenseApplicationUpdateParamsExpenseApplicationLines.new(id: 1,
                                 transaction_date: 2018-07-18,
                                 description: 交通費：新幹線往復（東京〜大阪）,
                                 amount: 30000,
                                 expense_application_line_template_id: 505,
                                 receipt_id: 606)
```


