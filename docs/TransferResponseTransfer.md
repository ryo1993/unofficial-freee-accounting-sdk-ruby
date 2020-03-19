# UnofficialFreeeSdk::TransferResponseTransfer

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 取引(振替)ID | 
**company_id** | **Integer** | 事業所ID | 
**amount** | **Integer** | 金額 | 
**date** | **String** | 振替日 (yyyy-mm-dd) | 
**from_walletable_type** | **String** | 振替元口座区分 (銀行口座: bank_account, クレジットカード: credit_card, 現金: wallet) | 
**from_walletable_id** | **Integer** | 振替元口座ID | 
**to_walletable_type** | **String** | 振替先口座区分 (銀行口座: bank_account, クレジットカード: credit_card, 現金: wallet) | 
**to_walletable_id** | **Integer** | 振替先口座ID | 
**description** | **String** | 備考 | 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::TransferResponseTransfer.new(id: 1,
                                 company_id: 1,
                                 amount: 5000,
                                 date: 2019-11-01,
                                 from_walletable_type: credit_card,
                                 from_walletable_id: 101,
                                 to_walletable_type: bank_account,
                                 to_walletable_id: 201,
                                 description: 備考)
```


