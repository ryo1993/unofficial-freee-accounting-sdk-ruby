# UnofficialFreeeSdk::CompanyIndexResponseCompanies

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 事業所ID | 
**name** | **String** | 事業所名 | 
**name_kana** | **String** | 事業所名（カナ） | 
**display_name** | **String** | 事業所名 | 
**role** | **String** | ユーザーの権限 | 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::CompanyIndexResponseCompanies.new(id: 1,
                                 name: freee事務所,
                                 name_kana: フリージムショ,
                                 display_name: freee事務所,
                                 role: admin)
```


