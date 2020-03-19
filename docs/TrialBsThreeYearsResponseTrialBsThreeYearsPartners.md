# UnofficialFreeeSdk::TrialBsThreeYearsResponseTrialBsThreeYearsPartners

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 取引先ID | 
**name** | **String** | 取引先名 | [optional] 
**two_years_before_closing_balance** | **Integer** | 前々年度期末残高 | [optional] 
**last_year_closing_balance** | **Integer** | 前年度期末残高 | [optional] 
**closing_balance** | **Integer** | 期末残高 | [optional] 
**year_on_year** | **Float** | 前年比 | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::TrialBsThreeYearsResponseTrialBsThreeYearsPartners.new(id: 22,
                                 name: freee,
                                 two_years_before_closing_balance: 0,
                                 last_year_closing_balance: 0,
                                 closing_balance: -25920,
                                 year_on_year: 0.12)
```


