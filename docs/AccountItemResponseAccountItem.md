# UnofficialFreeeSdk::AccountItemResponseAccountItem

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 勘定科目ID | 
**name** | **String** | 勘定科目名 (30文字以内) | 
**company_id** | **Integer** | 事業所ID | 
**tax_code** | **Integer** | 税区分コード | 
**account_category_id** | **Integer** | 勘定科目のカテゴリーコード | 
**shortcut** | **String** | ショートカット1 (20文字以内) | [optional] 
**shortcut_num** | **String** | ショートカット2(勘定科目コード) (20文字以内) | [optional] 
**corresponding_type_expense** | **Integer** | 支出取引相手勘定科目種別 | 
**corresponding_type_income** | **Integer** | 収入取引相手勘定科目種別 | 
**searchable** | **Integer** | 検索可能:2, 検索不可：3 | 
**accumulated_dep_account_item_name** | **String** | 減価償却累計額勘定科目 | [optional] 
**items** | [**Array&lt;AccountItemResponseAccountItemItems&gt;**](AccountItemResponseAccountItemItems.md) |  | [optional] 
**partners** | [**Array&lt;AccountItemResponseAccountItemPartners&gt;**](AccountItemResponseAccountItemPartners.md) |  | [optional] 
**available** | **Boolean** | 勘定科目の使用設定（true: 使用する、false: 使用しない） | 
**walletable_id** | **Integer** | 口座ID | 
**group_name** | **String** | 決算書表示名（小カテゴリー） | [optional] 
**corresponding_income_name** | **String** | 収入取引相手勘定科目名 | [optional] 
**corresponding_income_id** | **Integer** | 収入取引相手勘定科目ID | [optional] 
**corresponding_expense_name** | **String** | 支出取引相手勘定科目名 | [optional] 
**corresponding_expense_id** | **Integer** | 支出取引相手勘定科目ID | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::AccountItemResponseAccountItem.new(id: 1,
                                 name: ソフトウェア,
                                 company_id: 1,
                                 tax_code: 1,
                                 account_category_id: 1,
                                 shortcut: SOFUTO,
                                 shortcut_num: 123,
                                 corresponding_type_expense: 5,
                                 corresponding_type_income: 2,
                                 searchable: 2,
                                 accumulated_dep_account_item_name: 減価償却累計額,
                                 items: null,
                                 partners: null,
                                 available: true,
                                 walletable_id: 1,
                                 group_name: 売掛金,
                                 corresponding_income_name: 売掛金,
                                 corresponding_income_id: 1,
                                 corresponding_expense_name: 買掛金,
                                 corresponding_expense_id: 1)
```


