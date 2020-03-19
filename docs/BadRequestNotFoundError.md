# UnofficialFreeeSdk::BadRequestNotFoundError

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**status_code** | **Integer** |  | [optional] 
**errors** | [**Array&lt;BadRequestNotFoundErrorErrors&gt;**](BadRequestNotFoundErrorErrors.md) |  | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::BadRequestNotFoundError.new(status_code: 404,
                                 errors: null)
```


