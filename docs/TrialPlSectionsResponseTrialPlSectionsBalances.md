# UnofficialFreeeSdk::TrialPlSectionsResponseTrialPlSectionsBalances

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account_item_id** | **Integer** | 勘定科目ID(勘定科目の時のみ含まれる) | [optional] 
**account_item_name** | **String** | 勘定科目名(勘定科目の時のみ含まれる) | [optional] 
**sections** | [**Array&lt;TrialPlSectionsResponseTrialPlSectionsSections&gt;**](TrialPlSectionsResponseTrialPlSectionsSections.md) | 部門(勘定科目の時のみ含まれる) | [optional] 
**account_category_id** | **Integer** | 勘定科目カテゴリーID(勘定科目カテゴリーの時のみ含まれる) | [optional] 
**account_category_name** | **String** | 勘定科目カテゴリー名(勘定科目カテゴリーの時のみ含まれる) | [optional] 
**total_line** | **Boolean** | 合計行(勘定科目カテゴリー名の時のみ含まれる) | [optional] 
**hierarchy_level** | **Integer** | 階層レベル | [optional] 
**parent_account_category_id** | **Integer** | 上位科目カテゴリーID(上層が存在する場合含まれる) | [optional] 
**parent_account_category_name** | **String** | 上位勘定科目カテゴリー名(上層が存在する場合含まれる) | [optional] 
**closing_balance** | **Integer** | 期末残高 | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::TrialPlSectionsResponseTrialPlSectionsBalances.new(account_item_id: 192,
                                 account_item_name: 現金,
                                 sections: null,
                                 account_category_id: 8,
                                 account_category_name: 流動資産,
                                 total_line: true,
                                 hierarchy_level: 3,
                                 parent_account_category_id: 19,
                                 parent_account_category_name: 他流動資産,
                                 closing_balance: -25920)
```


