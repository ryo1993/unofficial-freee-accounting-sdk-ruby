# UnofficialFreeeSdk::TransfersApi

All URIs are relative to *https://api.freee.co.jp*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_transfer**](TransfersApi.md#create_transfer) | **POST** /api/1/transfers | 取引（振替）の作成
[**destroy_transfer**](TransfersApi.md#destroy_transfer) | **DELETE** /api/1/transfers/{id} | 取引（振替）の削除する
[**get_transfer**](TransfersApi.md#get_transfer) | **GET** /api/1/transfers/{id} | 取引（振替）の取得
[**get_transfers**](TransfersApi.md#get_transfers) | **GET** /api/1/transfers | 取引（振替）一覧の取得
[**update_transfer**](TransfersApi.md#update_transfer) | **PUT** /api/1/transfers/{id} | 取引（振替）の更新



## create_transfer

> TransferResponse create_transfer(opts)

取引（振替）の作成

 <h2 id=\"\">概要</h2>  <p>指定した事業所の取引（振替）を作成する</p>  <h2 id=\"_2\">定義</h2>  <ul> <li> <p>amount : 振替金額</p> </li>  <li> <p>from_walletable_type, to_walletable_type</p>  <ul> <li>bank_account : 銀行口座</li>  <li>credit_card : クレジットカード</li>  <li>wallet : その他の決済口座</li> </ul> </li> </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::TransfersApi.new
opts = {
  transfer_params: UnofficialFreeeSdk::TransferParams.new # TransferParams | 取引（振替）の作成
}

begin
  #取引（振替）の作成
  result = api_instance.create_transfer(opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling TransfersApi->create_transfer: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **transfer_params** | [**TransferParams**](TransferParams.md)| 取引（振替）の作成 | [optional] 

### Return type

[**TransferResponse**](TransferResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json


## destroy_transfer

> destroy_transfer(id, company_id)

取引（振替）の削除する

 <h2 id=\"\">概要</h2>  <p>指定した事業所の取引（振替）を削除する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::TransfersApi.new
id = 56 # Integer | 取引(振替)ID
company_id = 56 # Integer | 事業所ID

begin
  #取引（振替）の削除する
  api_instance.destroy_transfer(id, company_id)
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling TransfersApi->destroy_transfer: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| 取引(振替)ID | 
 **company_id** | **Integer**| 事業所ID | 

### Return type

nil (empty response body)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_transfer

> TransferResponse get_transfer(id, company_id)

取引（振替）の取得

 <h2 id=\"\">概要</h2>  <p>指定した事業所の取引（振替）を取得する</p>  <h2 id=\"_2\">定義</h2>  <ul> <li> <p>amount : 振替金額</p> </li>  <li> <p>from_walletable_type, to_walletable_type</p>  <ul> <li>bank_account : 銀行口座</li>  <li>credit_card : クレジットカード</li>  <li>wallet : その他の決済口座</li> </ul> </li> </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::TransfersApi.new
id = 56 # Integer | 取引(振替)ID
company_id = 56 # Integer | 事業所ID

begin
  #取引（振替）の取得
  result = api_instance.get_transfer(id, company_id)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling TransfersApi->get_transfer: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| 取引(振替)ID | 
 **company_id** | **Integer**| 事業所ID | 

### Return type

[**TransferResponse**](TransferResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_transfers

> InlineResponse20014 get_transfers(company_id, opts)

取引（振替）一覧の取得

 <h2 id=\"\">概要</h2>  <p>指定した事業所の取引（振替）一覧を取得する</p>  <h2 id=\"_2\">定義</h2>  <ul> <li> <p>amount : 振替金額</p> </li>  <li> <p>from_walletable_type, to_walletable_type</p>  <ul> <li>bank_account : 銀行口座</li>  <li>credit_card : クレジットカード</li>  <li>wallet : その他の決済口座</li> </ul> </li> </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::TransfersApi.new
company_id = 56 # Integer | 事業所ID
opts = {
  start_date: 'start_date_example', # String | 振替日で絞込：開始日 (yyyy-mm-dd)
  end_date: 'end_date_example', # String | 振替日で絞込：終了日 (yyyy-mm-dd)
  offset: 56, # Integer | 取得レコードのオフセット (デフォルト: 0)
  limit: 56 # Integer | 取得レコードの件数 (デフォルト: 20, 最小: 1, 最大: 100) 
}

begin
  #取引（振替）一覧の取得
  result = api_instance.get_transfers(company_id, opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling TransfersApi->get_transfers: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **company_id** | **Integer**| 事業所ID | 
 **start_date** | **String**| 振替日で絞込：開始日 (yyyy-mm-dd) | [optional] 
 **end_date** | **String**| 振替日で絞込：終了日 (yyyy-mm-dd) | [optional] 
 **offset** | **Integer**| 取得レコードのオフセット (デフォルト: 0) | [optional] 
 **limit** | **Integer**| 取得レコードの件数 (デフォルト: 20, 最小: 1, 最大: 100)  | [optional] 

### Return type

[**InlineResponse20014**](InlineResponse20014.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_transfer

> TransferResponse update_transfer(id, transfer_params)

取引（振替）の更新

 <h2 id=\"\">概要</h2>  <p>指定した事業所の取引（振替）を更新する</p>  <h2 id=\"_2\">定義</h2>  <ul> <li> <p>amount : 振替金額</p> </li>  <li> <p>from_walletable_type, to_walletable_type</p>  <ul> <li>bank_account : 銀行口座</li>  <li>credit_card : クレジットカード</li>  <li>wallet : その他の決済口座</li> </ul> </li> </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::TransfersApi.new
id = 56 # Integer | 取引(振替)ID
transfer_params = UnofficialFreeeSdk::TransferParams.new # TransferParams | 取引（振替）の更新

begin
  #取引（振替）の更新
  result = api_instance.update_transfer(id, transfer_params)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling TransfersApi->update_transfer: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| 取引(振替)ID | 
 **transfer_params** | [**TransferParams**](TransferParams.md)| 取引（振替）の更新 | 

### Return type

[**TransferResponse**](TransferResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json

