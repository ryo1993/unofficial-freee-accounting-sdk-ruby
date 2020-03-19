# UnofficialFreeeSdk::ItemsApi

All URIs are relative to *https://api.freee.co.jp*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_item**](ItemsApi.md#create_item) | **POST** /api/1/items | 品目の作成
[**destroy_item**](ItemsApi.md#destroy_item) | **DELETE** /api/1/items/{id} | 品目の削除
[**get_item**](ItemsApi.md#get_item) | **GET** /api/1/items/{id} | 品目の取得
[**get_items**](ItemsApi.md#get_items) | **GET** /api/1/items | 品目一覧の取得
[**update_item**](ItemsApi.md#update_item) | **PUT** /api/1/items/{id} | 品目の更新



## create_item

> ItemResponse create_item(opts)

品目の作成

 <h2 id=\"\">概要</h2>  <p>指定した事業所の品目を作成する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::ItemsApi.new
opts = {
  item_params: UnofficialFreeeSdk::ItemParams.new # ItemParams | 品目の作成
}

begin
  #品目の作成
  result = api_instance.create_item(opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling ItemsApi->create_item: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **item_params** | [**ItemParams**](ItemParams.md)| 品目の作成 | [optional] 

### Return type

[**ItemResponse**](ItemResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json


## destroy_item

> destroy_item(id, company_id)

品目の削除

 <h2 id=\"\">概要</h2>  <p>指定した事業所の品目を削除する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::ItemsApi.new
id = 56 # Integer | 品目ID
company_id = 56 # Integer | 事業所ID

begin
  #品目の削除
  api_instance.destroy_item(id, company_id)
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling ItemsApi->destroy_item: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| 品目ID | 
 **company_id** | **Integer**| 事業所ID | 

### Return type

nil (empty response body)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_item

> ItemResponse get_item(company_id, id)

品目の取得

 <h2 id=\"\">概要</h2>  <p>指定した事業所の品目を取得する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::ItemsApi.new
company_id = 56 # Integer | 事業所ID
id = 56 # Integer | 品目ID

begin
  #品目の取得
  result = api_instance.get_item(company_id, id)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling ItemsApi->get_item: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **company_id** | **Integer**| 事業所ID | 
 **id** | **Integer**| 品目ID | 

### Return type

[**ItemResponse**](ItemResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_items

> InlineResponse2009 get_items(company_id)

品目一覧の取得

 <h2 id=\"\">概要</h2>  <p>指定した事業所の品目一覧を取得する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::ItemsApi.new
company_id = 56 # Integer | 事業所ID

begin
  #品目一覧の取得
  result = api_instance.get_items(company_id)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling ItemsApi->get_items: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **company_id** | **Integer**| 事業所ID | 

### Return type

[**InlineResponse2009**](InlineResponse2009.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_item

> ItemResponse update_item(id, opts)

品目の更新

 <h2 id=\"\">概要</h2>  <p>指定した事業所の品目を更新する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::ItemsApi.new
id = 56 # Integer | 品目ID
opts = {
  item_params: UnofficialFreeeSdk::ItemParams.new # ItemParams | 品目の更新
}

begin
  #品目の更新
  result = api_instance.update_item(id, opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling ItemsApi->update_item: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| 品目ID | 
 **item_params** | [**ItemParams**](ItemParams.md)| 品目の更新 | [optional] 

### Return type

[**ItemResponse**](ItemResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json

