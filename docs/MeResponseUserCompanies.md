# UnofficialFreeeSdk::MeResponseUserCompanies

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 事業所ID | 
**display_name** | **String** | 表示名 | 
**role** | **String** | ユーザーの権限 | 
**use_custom_role** | **Boolean** | カスタム権限（true: 使用する、false: 使用しない） | 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::MeResponseUserCompanies.new(id: 1,
                                 display_name: freee株式会社,
                                 role: admin,
                                 use_custom_role: false)
```


