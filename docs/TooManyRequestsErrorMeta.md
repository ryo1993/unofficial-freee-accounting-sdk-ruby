# UnofficialFreeeSdk::TooManyRequestsErrorMeta

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**limit** | **Integer** | 設定されている上限値 | 
**period** | **Integer** | 使用回数をカウントする期間 (秒) | [optional] 
**remaining** | **Integer** | 上限に達するまでの使用可能回数 | 
**reset** | **String** | （上限値に達した場合）使用回数がリセットされる時刻 | 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::TooManyRequestsErrorMeta.new(limit: 100,
                                 period: 5,
                                 remaining: 0,
                                 reset: 2018-09-12T18:30:24+09:00)
```


