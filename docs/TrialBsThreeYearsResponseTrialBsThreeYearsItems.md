# UnofficialFreeeSdk::TrialBsThreeYearsResponseTrialBsThreeYearsItems

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 品目ID | 
**name** | **String** | 品目 | [optional] 
**two_years_before_closing_balance** | **Integer** | 前々年度期末残高 | [optional] 
**last_year_closing_balance** | **Integer** | 前年度期末残高 | [optional] 
**closing_balance** | **Integer** | 期末残高 | [optional] 
**year_on_year** | **Float** | 前年比 | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::TrialBsThreeYearsResponseTrialBsThreeYearsItems.new(id: 1,
                                 name: 源泉所得税,
                                 two_years_before_closing_balance: 0,
                                 last_year_closing_balance: 0,
                                 closing_balance: -25920,
                                 year_on_year: 0.12)
```


