# UnofficialFreeeSdk::TooManyRequestsError

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**status_code** | **Integer** |  | 
**meta** | [**TooManyRequestsErrorMeta**](TooManyRequestsErrorMeta.md) |  | 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::TooManyRequestsError.new(status_code: 429,
                                 meta: null)
```


