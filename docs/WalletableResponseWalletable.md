# UnofficialFreeeSdk::WalletableResponseWalletable

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 口座ID | 
**name** | **String** | 口座名 (255文字以内) | 
**bank_id** | **Integer** | サービスID | 
**type** | **String** | 口座区分 (銀行口座: bank_account, クレジットカード: credit_card, 現金: wallet) | 
**last_balance** | **Integer** | 同期残高 | [optional] 
**walletable_balance** | **Integer** | 登録残高 | [optional] 
**meta** | [**InlineResponse20012Meta**](InlineResponse20012Meta.md) |  | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::WalletableResponseWalletable.new(id: 1,
                                 name: freee銀行,
                                 bank_id: 3,
                                 type: bank_account,
                                 last_balance: 1565583,
                                 walletable_balance: 1340261,
                                 meta: null)
```


