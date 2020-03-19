# UnofficialFreeeSdk::BanksApi

All URIs are relative to *https://api.freee.co.jp*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_bank**](BanksApi.md#get_bank) | **GET** /api/1/banks/{id} | 連携サービスの取得
[**get_banks**](BanksApi.md#get_banks) | **GET** /api/1/banks | 連携サービス一覧の取得



## get_bank

> BankResponse get_bank(id)

連携サービスの取得

 <h2 id=\"\">概要</h2>  <p>連携しているサービスを取得する</p>  <h2 id=\"_2\">定義</h2>  <ul> <li>type <ul> <li>bank_account : 銀行口座</li>  <li>credit_card : クレジットカード</li>  <li>wallet : その他の決済口座</li> </ul> </li> </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::BanksApi.new
id = 56 # Integer | 連携サービスID

begin
  #連携サービスの取得
  result = api_instance.get_bank(id)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling BanksApi->get_bank: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| 連携サービスID | 

### Return type

[**BankResponse**](BankResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_banks

> InlineResponse20013 get_banks(opts)

連携サービス一覧の取得

 <h2 id=\"\">概要</h2>  <p>連携しているサービス一覧を取得する</p>  <h2 id=\"_2\">定義</h2>  <ul> <li>type <ul> <li>bank_account : 銀行口座</li>  <li>credit_card : クレジットカード</li>  <li>wallet : その他の決済口座</li> </ul> </li> </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::BanksApi.new
opts = {
  offset: 56, # Integer | 取得レコードのオフセット (デフォルト: 0)
  limit: 56, # Integer | 取得レコードの件数 (デフォルト: 20, 最小: 1, 最大: 500)
  type: 'type_example' # String | サービス種別
}

begin
  #連携サービス一覧の取得
  result = api_instance.get_banks(opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling BanksApi->get_banks: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **offset** | **Integer**| 取得レコードのオフセット (デフォルト: 0) | [optional] 
 **limit** | **Integer**| 取得レコードの件数 (デフォルト: 20, 最小: 1, 最大: 500) | [optional] 
 **type** | **String**| サービス種別 | [optional] 

### Return type

[**InlineResponse20013**](InlineResponse20013.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

