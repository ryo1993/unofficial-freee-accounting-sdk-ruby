# UnofficialFreeeSdk::WalletableCreateResponse

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 口座ID | 
**name** | **String** | 口座名, 最大255文字 | 
**bank_id** | **Integer** | サービスID | 
**type** | **String** | 口座区分 (銀行口座: bank_account, クレジットカード: credit_card, 現金: wallet) | 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::WalletableCreateResponse.new(id: 1,
                                 name: 〇〇銀行,
                                 bank_id: 1,
                                 type: bank_account)
```


