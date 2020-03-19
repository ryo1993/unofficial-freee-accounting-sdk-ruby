# UnofficialFreeeSdk::CompanyParams

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | 事業所の正式名称 (100文字以内) | [optional] 
**name_kana** | **String** | 正式名称フリガナ (100文字以内) | [optional] 
**contact_name** | **String** | 担当者名 (50文字以内) | [optional] 
**address_attributes** | [**CompanyParamsAddressAttributes**](CompanyParamsAddressAttributes.md) |  | [optional] 
**phone1** | **String** | 電話番号１ | [optional] 
**phone2** | **String** | 電話番号２ | [optional] 
**fax** | **String** | FAX | [optional] 
**sales_information_attributes** | [**CompanyParamsSalesInformationAttributes**](CompanyParamsSalesInformationAttributes.md) |  | [optional] 
**head_count** | **Float** | 従業員数（0: 経営者のみ、1: 2~5人、2: 6~10人、3: 11~20人、13: 21~50人、14: 51~100人、15: 101~300人、18: 301~500人、16: 501~1,000人、17: 1,001人以上 | [optional] 
**corporate_number** | **String** | 法人番号 (半角数字13桁、法人のみ) | [optional] 
**fiscal_years_attributes** | [**CompanyParamsFiscalYearsAttributes**](CompanyParamsFiscalYearsAttributes.md) |  | [optional] 
**doc_template** | [**CompanyParamsDocTemplate**](CompanyParamsDocTemplate.md) |  | [optional] 
**txn_number_format** | **String** | 仕訳番号形式（not_used: 使用しない、digits: 数字（例：5091824）、alnum: 英数字（例：59J0P））Available values : not_used, digits, alnum | [optional] 
**private_settlement** | **Integer** | プライベート資金/役員資金（0: 使用しない、1: 使用する） | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::CompanyParams.new(name: freee事務所,
                                 name_kana: フリージムショ,
                                 contact_name: 担当者,
                                 address_attributes: null,
                                 phone1: 03-1234-xxxx,
                                 phone2: 090-1234-xxxx,
                                 fax: 03-1234-xxxx,
                                 sales_information_attributes: null,
                                 head_count: 1,
                                 corporate_number: 1234567890123,
                                 fiscal_years_attributes: null,
                                 doc_template: null,
                                 txn_number_format: not_used,
                                 private_settlement: 1)
```


