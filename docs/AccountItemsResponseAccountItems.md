# UnofficialFreeeSdk::AccountItemsResponseAccountItems

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 勘定科目ID | 
**name** | **String** | 勘定科目名 (30文字以内) | 
**shortcut** | **String** | ショートカット1 (20文字以内) | [optional] 
**shortcut_num** | **String** | ショートカット2(勘定科目コード) (20文字以内) | [optional] 
**default_tax_id** | **Integer** | デフォルト設定がされている税区分ID | [optional] 
**default_tax_code** | **Integer** | デフォルト設定がされている税区分コード | 
**categories** | **Array&lt;String&gt;** |  | 
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

instance = UnofficialFreeeSdk::AccountItemsResponseAccountItems.new(id: 1,
                                 name: ソフトウェア,
                                 shortcut: SOFUTO,
                                 shortcut_num: 123,
                                 default_tax_id: 34,
                                 default_tax_code: 34,
                                 categories: null,
                                 available: true,
                                 walletable_id: 1,
                                 group_name: 売掛金,
                                 corresponding_income_name: 売掛金,
                                 corresponding_income_id: 1,
                                 corresponding_expense_name: 買掛金,
                                 corresponding_expense_id: 1)
```


