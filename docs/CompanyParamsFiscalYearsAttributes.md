# UnofficialFreeeSdk::CompanyParamsFiscalYearsAttributes

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**use_industry_template** | **Integer** | 製造業向け機能（0: 使用しない、1: 使用する） | [optional] 
**indirect_write_off_method** | **Integer** | 固定資産の控除法（0: 直接控除法、1: 間接控除法） | [optional] 
**indirect_write_off_method_type** | **Integer** | 間接控除時の累計額（0: 共通、1: 資産分類別） | [optional] 
**start_date** | **String** | 期首日 | [optional] 
**end_date** | **String** | 期末日（決算日） | [optional] 
**accounting_period** | **Integer** | 期 | [optional] 
**depreciation_fraction** | **Integer** | 減価償却端数処理法(法人のみ)(0: 切り捨て、1: 切り上げ) | [optional] 
**return_code** | **Integer** | 不動産所得使用区分(個人事業主のみ)（0: 使用しない、3: 使用する） | [optional] 
**tax_fraction** | **Integer** | 消費税端数処理方法（0: 切り上げ、1: 切り捨て, 2: 四捨五入） | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::CompanyParamsFiscalYearsAttributes.new(use_industry_template: null,
                                 indirect_write_off_method: null,
                                 indirect_write_off_method_type: null,
                                 start_date: null,
                                 end_date: null,
                                 accounting_period: null,
                                 depreciation_fraction: null,
                                 return_code: null,
                                 tax_fraction: null)
```


