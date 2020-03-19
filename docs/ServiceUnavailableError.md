# UnofficialFreeeSdk::ServiceUnavailableError

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**status_code** | **Integer** |  | 
**errors** | [**Array&lt;ServiceUnavailableErrorErrors&gt;**](ServiceUnavailableErrorErrors.md) |  | 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::ServiceUnavailableError.new(status_code: 503,
                                 errors: null)
```


