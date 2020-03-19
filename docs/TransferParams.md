# UnofficialFreeeSdk::TransferParams

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**to_walletable_id** | **Integer** | 振替先口座ID | 
**to_walletable_type** | **String** | 振替先口座区分 (銀行口座: bank_account, クレジットカード: credit_card, 現金: wallet) | 
**from_walletable_id** | **Integer** | 振替元口座ID | 
**from_walletable_type** | **String** | 振替元口座区分 (銀行口座: bank_account, クレジットカード: credit_card, 現金: wallet) | 
**amount** | **Integer** | 金額 | 
**date** | **String** | 振替日 (yyyy-mm-dd) | 
**company_id** | **Integer** | 事業所ID | 
**description** | **String** | 備考 | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::TransferParams.new(to_walletable_id: 1,
                                 to_walletable_type: bank_account,
                                 from_walletable_id: 1,
                                 from_walletable_type: credit_card,
                                 amount: 5000,
                                 date: 2018-01-01,
                                 company_id: 1,
                                 description: 備考)
```


