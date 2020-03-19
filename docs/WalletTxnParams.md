# UnofficialFreeeSdk::WalletTxnParams

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**entry_side** | **String** | 入金／出金 (入金: income, 出金: expense) | 
**description** | **String** | 備考 | [optional] 
**amount** | **Integer** | 取引金額 | 
**walletable_id** | **Integer** | 口座ID | 
**walletable_type** | **String** | 口座区分 (銀行口座: bank_account, クレジットカード: credit_card, 現金: wallet) | 
**date** | **String** | 取引日 (yyyy-mm-dd) | 
**company_id** | **Integer** | 事業所ID | 
**balance** | **Integer** | 残高 (銀行口座等) | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::WalletTxnParams.new(entry_side: income,
                                 description: 備考,
                                 amount: 5000,
                                 walletable_id: 1,
                                 walletable_type: bank_account,
                                 date: 2018-01-01,
                                 company_id: 1,
                                 balance: 10000)
```


