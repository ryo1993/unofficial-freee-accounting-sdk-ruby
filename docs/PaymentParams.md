# UnofficialFreeeSdk::PaymentParams

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**company_id** | **Integer** | 事業所ID | 
**date** | **String** | 支払日 | 
**from_walletable_type** | **String** | 口座区分 (銀行口座: bank_account, クレジットカード: credit_card, 現金: wallet, プライベート資金（法人の場合は役員借入金もしくは役員借入金、個人の場合は事業主貸もしくは事業主借）: private_account_item)：payments指定時は必須 | 
**from_walletable_id** | **Integer** | 口座ID（from_walletable_typeがprivate_account_itemの場合は勘定科目ID）：payments指定時は必須 | 
**amount** | **Integer** | 金額 | 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::PaymentParams.new(company_id: 1,
                                 date: 2018-01-01,
                                 from_walletable_type: 2018-01-01,
                                 from_walletable_id: 1,
                                 amount: 10000)
```


