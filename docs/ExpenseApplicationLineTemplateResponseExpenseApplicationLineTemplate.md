# UnofficialFreeeSdk::ExpenseApplicationLineTemplateResponseExpenseApplicationLineTemplate

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 経費科目ID | 
**name** | **String** | 経費科目名 | 
**account_item_id** | **Integer** | 勘定科目ID | [optional] 
**account_item_name** | **String** | 勘定科目名 | 
**tax_code** | **Integer** | 税区分コード | [optional] 
**tax_name** | **String** | 税区分名 | 
**description** | **String** | 経費科目の説明 | [optional] 
**line_description** | **String** | 内容の補足 | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::ExpenseApplicationLineTemplateResponseExpenseApplicationLineTemplate.new(id: 1,
                                 name: 交通費,
                                 account_item_id: 1,
                                 account_item_name: 旅費交通費,
                                 tax_code: 1,
                                 tax_name: 課対仕入,
                                 description: 電車、バス、飛行機などの交通費,
                                 line_description: 移動区間)
```


