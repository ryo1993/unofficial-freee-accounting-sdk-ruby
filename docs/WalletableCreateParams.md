# UnofficialFreeeSdk::WalletableCreateParams

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | 口座名 (255文字以内) | 
**type** | **String** | 口座種別（bank_account : 銀行口座, credit_card : クレジットカード, wallet : その他の決済口座） | 
**company_id** | **Integer** | 事業所ID | 
**bank_id** | **Integer** | サービスID | [optional] 
**group_name** | **String** | 決算書表示名（小カテゴリー）　例：売掛金, 受取手形, 未収入金（法人のみ）, 買掛金, 支払手形, 未払金, 預り金, 前受金 | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::WalletableCreateParams.new(name: ＸＸ銀行,
                                 type: bank_account,
                                 company_id: 1,
                                 bank_id: 1,
                                 group_name: 売掛金)
```


