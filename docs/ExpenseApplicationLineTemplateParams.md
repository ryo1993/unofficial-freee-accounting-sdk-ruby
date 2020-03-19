# UnofficialFreeeSdk::ExpenseApplicationLineTemplateParams

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**company_id** | **Integer** | 事業所ID | 
**name** | **String** | 経費科目名 (100文字以内) | 
**account_items_id** | **Integer** | 勘定科目ID | [optional] 
**item_id** | **Integer** | 品目ID | [optional] 
**tax_code** | **Integer** | 税区分コード（税区分のdisplay_categoryがtax_5: 5%表示の税区分, tax_r8: 軽減税率8%表示の税区分に該当するtax_codeのみ利用可能です。税区分のdisplay_categoryは /taxes/companies/{:company_id}のAPIから取得可能です。） | 
**description** | **String** | 経費科目の説明 (1000文字以内) | [optional] 
**line_description** | **String** | 内容の補足 (1000文字以内) | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::ExpenseApplicationLineTemplateParams.new(company_id: 1,
                                 name: 交通費,
                                 account_items_id: 1,
                                 item_id: 1,
                                 tax_code: 1,
                                 description: 電車、バス、飛行機などの交通費,
                                 line_description: 移動区間)
```


