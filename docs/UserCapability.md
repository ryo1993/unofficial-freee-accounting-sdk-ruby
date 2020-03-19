# UnofficialFreeeSdk::UserCapability

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**read** | **Boolean** | 閲覧 | [optional] 
**create** | **Boolean** | 作成 | [optional] 
**update** | **Boolean** | 更新 | [optional] 
**destroy** | **Boolean** | 削除 | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::UserCapability.new(read: true,
                                 create: true,
                                 update: true,
                                 destroy: true)
```


