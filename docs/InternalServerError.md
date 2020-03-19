# UnofficialFreeeSdk::InternalServerError

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**status_code** | **Integer** |  | [optional] 
**errors** | [**Array&lt;InternalServerErrorErrors&gt;**](InternalServerErrorErrors.md) |  | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::InternalServerError.new(status_code: 500,
                                 errors: null)
```


