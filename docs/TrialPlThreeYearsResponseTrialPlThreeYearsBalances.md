# UnofficialFreeeSdk::TrialPlThreeYearsResponseTrialPlThreeYearsBalances

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account_item_id** | **Integer** | 勘定科目ID(勘定科目の時のみ含まれる) | [optional] 
**account_item_name** | **String** | 勘定科目名(勘定科目の時のみ含まれる) | [optional] 
**partners** | [**Array&lt;TrialBsThreeYearsResponseTrialBsThreeYearsPartners&gt;**](TrialBsThreeYearsResponseTrialBsThreeYearsPartners.md) | breakdown_display_type:partner, account_item_display_type:account_item指定時のみ含まれる | [optional] 
**items** | [**Array&lt;TrialBsThreeYearsResponseTrialBsThreeYearsItems&gt;**](TrialBsThreeYearsResponseTrialBsThreeYearsItems.md) | breakdown_display_type:item, account_item_display_type:account_item指定時のみ含まれる | [optional] 
**sections** | [**Array&lt;TrialPlThreeYearsResponseTrialPlThreeYearsSections&gt;**](TrialPlThreeYearsResponseTrialPlThreeYearsSections.md) | breakdown_display_type:section, account_item_display_type:account_item指定時のみ含まれる | [optional] 
**account_category_id** | **Integer** | 勘定科目カテゴリーID(勘定科目カテゴリーの時のみ含まれる) | [optional] 
**account_category_name** | **String** | 勘定科目カテゴリー名(勘定科目カテゴリーの時のみ含まれる) | [optional] 
**total_line** | **Boolean** | 合計行(勘定科目カテゴリー名の時のみ含まれる) | [optional] 
**hierarchy_level** | **Integer** | 階層レベル | [optional] 
**parent_account_category_id** | **Integer** | 上位科目カテゴリーID(上層が存在する場合含まれる) | [optional] 
**parent_account_category_name** | **String** | 上位勘定科目カテゴリー名(上層が存在する場合含まれる) | [optional] 
**two_years_before_closing_balance** | **Integer** | 前々年度期末残高 | [optional] 
**last_year_closing_balance** | **Integer** | 前年度期末残高 | [optional] 
**closing_balance** | **Integer** | 期末残高 | [optional] 
**year_on_year** | **Float** | 前年比 | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::TrialPlThreeYearsResponseTrialPlThreeYearsBalances.new(account_item_id: 192,
                                 account_item_name: 現金,
                                 partners: null,
                                 items: null,
                                 sections: null,
                                 account_category_id: 8,
                                 account_category_name: 流動資産,
                                 total_line: true,
                                 hierarchy_level: 3,
                                 parent_account_category_id: 19,
                                 parent_account_category_name: 他流動資産,
                                 two_years_before_closing_balance: 0,
                                 last_year_closing_balance: 0,
                                 closing_balance: -25920,
                                 year_on_year: 0.12)
```


