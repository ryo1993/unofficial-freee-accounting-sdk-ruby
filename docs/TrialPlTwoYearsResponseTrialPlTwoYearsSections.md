# UnofficialFreeeSdk::TrialPlTwoYearsResponseTrialPlTwoYearsSections

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 部門ID | 
**name** | **String** | 部門名 | [optional] 
**last_year_closing_balance** | **Integer** | 前年度期末残高 | [optional] 
**closing_balance** | **Integer** | 期末残高 | [optional] 
**year_on_year** | **Float** | 前年比 | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::TrialPlTwoYearsResponseTrialPlTwoYearsSections.new(id: 1,
                                 name: 開発部門,
                                 last_year_closing_balance: 0,
                                 closing_balance: -25920,
                                 year_on_year: 0.12)
```


