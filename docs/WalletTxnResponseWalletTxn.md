# UnofficialFreeeSdk::WalletTxnResponseWalletTxn

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 明細ID | 
**company_id** | **Integer** | 事業所ID | 
**date** | **String** | 取引日(yyyy-mm-dd) | 
**amount** | **Integer** | 取引金額 | 
**due_amount** | **Integer** | 未決済金額 | 
**balance** | **Integer** | 残高(銀行口座等) | 
**entry_side** | **String** | 入金／出金 (入金: income, 出金: expense) | 
**walletable_type** | **String** | 口座区分 (銀行口座: bank_account, クレジットカード: credit_card, 現金: wallet) | 
**walletable_id** | **Integer** | 口座ID | 
**description** | **String** | 備考 | 
**status** | **Integer** | 明細のステータス（消込待ち: 1, 消込済み: 2, 無視: 3, 消込中: 4） | 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::WalletTxnResponseWalletTxn.new(id: 1,
                                 company_id: 1,
                                 date: 2018-01-01,
                                 amount: 5000,
                                 due_amount: 0,
                                 balance: 10000,
                                 entry_side: income,
                                 walletable_type: bank_account,
                                 walletable_id: 1,
                                 description: 振込 カ）ABC,
                                 status: null)
```


