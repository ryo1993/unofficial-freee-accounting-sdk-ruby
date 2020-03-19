# UnofficialFreeeSdk::BadRequestError

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**status_code** | **Integer** |  | [optional] 
**errors** | [**Array&lt;BadRequestErrorErrors&gt;**](BadRequestErrorErrors.md) |  | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::BadRequestError.new(status_code: 400,
                                 errors: null)
```


