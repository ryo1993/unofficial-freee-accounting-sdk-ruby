# UnofficialFreeeSdk::PartnerCreateParamsPartnerBankAccountAttributes

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**bank_name** | **String** | 銀行名 | [optional] 
**bank_name_kana** | **String** | 銀行名（カナ） | [optional] 
**bank_code** | **String** | 銀行番号 | [optional] 
**branch_name** | **String** | 支店名 | [optional] 
**branch_kana** | **String** | 支店名（カナ） | [optional] 
**branch_code** | **String** | 支店番号 | [optional] 
**account_type** | **String** | 口座種別(ordinary:普通、checking：当座、earmarked：納税準備預金、savings：貯蓄、other:その他) | [optional] 
**account_number** | **String** | 口座番号 | [optional] 
**long_account_name** | **String** | 受取人名 | [optional] 
**account_name** | **String** | 受取人名（カナ） | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::PartnerCreateParamsPartnerBankAccountAttributes.new(bank_name: ＸＸ銀行,
                                 bank_name_kana: ＸＸ,
                                 bank_code: 001,
                                 branch_name: 銀座支店,
                                 branch_kana: ギンザ,
                                 branch_code: 101,
                                 account_type: ordinary,
                                 account_number: 1010101,
                                 long_account_name: freee太郎,
                                 account_name: フリータロウ)
```


