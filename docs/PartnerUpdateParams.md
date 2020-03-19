# UnofficialFreeeSdk::PartnerUpdateParams

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**company_id** | **Integer** | 事業所ID | 
**name** | **String** | 取引先名 (255文字以内) | 
**shortcut1** | **String** | ショートカット１ (255文字以内) | [optional] 
**shortcut2** | **String** | ショートカット２ (255文字以内) | [optional] 
**long_name** | **String** | 正式名称（255文字以内） | [optional] 
**name_kana** | **String** | カナ名称（255文字以内） | [optional] 
**default_title** | **String** | 敬称（御中、様、(空白)の3つから選択） | [optional] 
**phone** | **String** | 電話番号 | [optional] 
**contact_name** | **String** | 担当者 氏名 (255文字以内) | [optional] 
**email** | **String** | 担当者 メールアドレス (255文字以内) | [optional] 
**address_attributes** | [**PartnerCreateParamsAddressAttributes**](PartnerCreateParamsAddressAttributes.md) |  | [optional] 
**partner_doc_setting_attributes** | [**PartnerCreateParamsPartnerDocSettingAttributes**](PartnerCreateParamsPartnerDocSettingAttributes.md) |  | [optional] 
**partner_bank_account_attributes** | [**PartnerCreateParamsPartnerBankAccountAttributes**](PartnerCreateParamsPartnerBankAccountAttributes.md) |  | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::PartnerUpdateParams.new(company_id: 1,
                                 name: 新しい取引先,
                                 shortcut1: NEWPARTNER,
                                 shortcut2: 502,
                                 long_name: 新しい取引先正式名称,
                                 name_kana: アタラシイトリヒキサキメイショウ,
                                 default_title: 御中,
                                 phone: 03-1234-xxxx,
                                 contact_name: 営業担当,
                                 email: contact@example.com,
                                 address_attributes: null,
                                 partner_doc_setting_attributes: null,
                                 partner_bank_account_attributes: null)
```


