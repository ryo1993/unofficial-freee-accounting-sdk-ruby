# UnofficialFreeeSdk::BankResponseBank

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 連携サービスID | 
**name** | **String** | 連携サービス名 | [optional] 
**type** | **String** | 連携サービス種別: (銀行口座: bank_account, クレジットカード: credit_card, 現金: wallet) | [optional] 
**name_kana** | **String** | 連携サービス名(カナ) | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::BankResponseBank.new(id: 1,
                                 name: 〇〇銀行,
                                 type: bank_account,
                                 name_kana: ギンコウ)
```


