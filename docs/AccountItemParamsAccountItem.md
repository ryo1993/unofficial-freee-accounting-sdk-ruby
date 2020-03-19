# UnofficialFreeeSdk::AccountItemParamsAccountItem

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | 勘定科目名 (30文字以内) | 
**shortcut** | **String** | ショートカット1 (20文字以内) | [optional] 
**shortcut_num** | **String** | ショートカット2(勘定科目コード)(20文字以内) | [optional] 
**tax_name** | **String** | 税区分 | 
**group_name** | **String** | 決算書表示名（小カテゴリー） | 
**account_category** | **String** | 勘定科目カテゴリー | 
**corresponding_income_name** | **String** | 収入取引相手勘定科目名 | 
**corresponding_expense_name** | **String** | 支出取引相手勘定科目名 | 
**accumulated_dep_account_item_name** | **String** | 減価償却累計額勘定科目 | [optional] 
**searchable** | **Integer** | 検索可能:2, 検索不可：3(登録時未指定の場合は2で登録されます。更新時未指定の場合はsearchableは変更されません。) | [optional] 
**items** | [**Array&lt;AccountItemParamsAccountItemItems&gt;**](AccountItemParamsAccountItemItems.md) | 品目 | [optional] 
**partners** | [**Array&lt;AccountItemParamsAccountItemItems&gt;**](AccountItemParamsAccountItemItems.md) | 取引先 | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::AccountItemParamsAccountItem.new(name: null,
                                 shortcut: null,
                                 shortcut_num: null,
                                 tax_name: null,
                                 group_name: null,
                                 account_category: null,
                                 corresponding_income_name: null,
                                 corresponding_expense_name: null,
                                 accumulated_dep_account_item_name: null,
                                 searchable: null,
                                 items: null,
                                 partners: null)
```


