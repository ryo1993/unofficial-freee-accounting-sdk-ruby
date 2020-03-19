# UnofficialFreeeSdk::ExpenseApplicationResponseExpenseApplicationExpenseApplicationLines

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 経費申請の項目行ID | 
**transaction_date** | **String** | 日付 (yyyy-mm-dd) | [optional] 
**description** | **String** | 内容 | [optional] 
**amount** | **Integer** | 金額 | [optional] 
**expense_application_line_template_id** | **Integer** | 経費科目ID | [optional] 
**receipt_id** | **Integer** | 証憑ID | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::ExpenseApplicationResponseExpenseApplicationExpenseApplicationLines.new(id: 1,
                                 transaction_date: 2018-07-18,
                                 description: 交通費：新幹線往復（東京〜大阪）,
                                 amount: 30000,
                                 expense_application_line_template_id: 505,
                                 receipt_id: 606)
```


