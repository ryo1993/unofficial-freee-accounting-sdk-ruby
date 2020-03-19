# UnofficialFreeeSdk::TrialBsResponseTrialBsBalances

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account_item_id** | **Integer** | 勘定科目ID(勘定科目の時のみ含まれる) | [optional] 
**account_item_name** | **String** | 勘定科目名(勘定科目の時のみ含まれる) | [optional] 
**partners** | [**Array&lt;TrialBsResponseTrialBsPartners&gt;**](TrialBsResponseTrialBsPartners.md) | breakdown_display_type:partner, account_item_display_type:account_item指定時のみ含まれる | [optional] 
**items** | [**Array&lt;TrialBsResponseTrialBsItems&gt;**](TrialBsResponseTrialBsItems.md) | breakdown_display_type:item, account_item_display_type:account_item指定時のみ含まれる | [optional] 
**account_category_id** | **Integer** | 勘定科目カテゴリーID(勘定科目カテゴリーの時のみ含まれる) | [optional] 
**account_category_name** | **String** | 勘定科目カテゴリー名(勘定科目カテゴリーの時のみ含まれる) | [optional] 
**total_line** | **Boolean** | 合計行(勘定科目カテゴリー名の時のみ含まれる) | [optional] 
**hierarchy_level** | **Integer** | 階層レベル | [optional] 
**parent_account_category_id** | **Integer** | 上位科目カテゴリーID(上層が存在する場合含まれる) | [optional] 
**parent_account_category_name** | **String** | 上位勘定科目カテゴリー名(上層が存在する場合含まれる) | [optional] 
**opening_balance** | **Integer** | 期首残高 | [optional] 
**debit_amount** | **Integer** | 借方金額 | [optional] 
**credit_amount** | **Integer** | 貸方金額 | [optional] 
**closing_balance** | **Integer** | 期末残高 | [optional] 
**composition_ratio** | **Float** | 構成比 | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::TrialBsResponseTrialBsBalances.new(account_item_id: 192,
                                 account_item_name: 現金,
                                 partners: null,
                                 items: null,
                                 account_category_id: 8,
                                 account_category_name: 流動資産,
                                 total_line: true,
                                 hierarchy_level: 3,
                                 parent_account_category_id: 19,
                                 parent_account_category_name: 他流動資産,
                                 opening_balance: 0,
                                 debit_amount: 0,
                                 credit_amount: 2592,
                                 closing_balance: -25920,
                                 composition_ratio: 0.85)
```


