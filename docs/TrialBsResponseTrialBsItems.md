# UnofficialFreeeSdk::TrialBsResponseTrialBsItems

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 品目ID | 
**name** | **String** | 品目 | [optional] 
**opening_balance** | **Integer** | 期首残高 | [optional] 
**debit_amount** | **Integer** | 借方金額 | [optional] 
**credit_amount** | **Integer** | 貸方金額 | [optional] 
**closing_balance** | **Integer** | 期末残高 | [optional] 
**composition_ratio** | **Float** | 構成比 | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::TrialBsResponseTrialBsItems.new(id: 1,
                                 name: 源泉所得税,
                                 opening_balance: 0,
                                 debit_amount: 0,
                                 credit_amount: 2592,
                                 closing_balance: -25920,
                                 composition_ratio: 0.85)
```


