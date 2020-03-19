# UnofficialFreeeSdk::TagsApi

All URIs are relative to *https://api.freee.co.jp*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_tag**](TagsApi.md#create_tag) | **POST** /api/1/tags | メモタグの作成
[**destroy_tag**](TagsApi.md#destroy_tag) | **DELETE** /api/1/tags/{id} | メモタグの削除
[**get_tag**](TagsApi.md#get_tag) | **GET** /api/1/tags/{id} | メモタグの詳細情報の取得
[**get_tags**](TagsApi.md#get_tags) | **GET** /api/1/tags | メモタグ一覧の取得
[**update_tag**](TagsApi.md#update_tag) | **PUT** /api/1/tags/{id} | メモタグの更新



## create_tag

> TagResponse create_tag(tag_params)

メモタグの作成

 <h2 id=\"\">概要</h2>  <p>指定した事業所のメモタグを作成する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::TagsApi.new
tag_params = UnofficialFreeeSdk::TagParams.new # TagParams | メモタグの作成

begin
  #メモタグの作成
  result = api_instance.create_tag(tag_params)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling TagsApi->create_tag: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tag_params** | [**TagParams**](TagParams.md)| メモタグの作成 | 

### Return type

[**TagResponse**](TagResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json


## destroy_tag

> destroy_tag(id, company_id)

メモタグの削除

 <h2 id=\"\">概要</h2>  <p>指定した事業所のメモタグを削除する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::TagsApi.new
id = 56 # Integer | タグID
company_id = 56 # Integer | 事業所ID

begin
  #メモタグの削除
  api_instance.destroy_tag(id, company_id)
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling TagsApi->destroy_tag: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| タグID | 
 **company_id** | **Integer**| 事業所ID | 

### Return type

nil (empty response body)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_tag

> TagResponse get_tag(id, company_id)

メモタグの詳細情報の取得

 <h2 id=\"\">概要</h2>  <p>指定した事業所のメモタグを取得する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::TagsApi.new
id = 56 # Integer | タグID
company_id = 56 # Integer | 事業所ID

begin
  #メモタグの詳細情報の取得
  result = api_instance.get_tag(id, company_id)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling TagsApi->get_tag: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| タグID | 
 **company_id** | **Integer**| 事業所ID | 

### Return type

[**TagResponse**](TagResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_tags

> InlineResponse2001 get_tags(company_id)

メモタグ一覧の取得

 <h2 id=\"\">概要</h2>  <p>指定した事業所のメモタグ一覧を取得する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::TagsApi.new
company_id = 56 # Integer | 事業所ID

begin
  #メモタグ一覧の取得
  result = api_instance.get_tags(company_id)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling TagsApi->get_tags: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **company_id** | **Integer**| 事業所ID | 

### Return type

[**InlineResponse2001**](InlineResponse2001.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_tag

> TagResponse update_tag(id, opts)

メモタグの更新

 <h2 id=\"\">概要</h2>  <p>指定した事業所のメモタグを更新する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::TagsApi.new
id = 56 # Integer | メモタグID
opts = {
  tag_params: UnofficialFreeeSdk::TagParams.new # TagParams | メモタグの更新
}

begin
  #メモタグの更新
  result = api_instance.update_tag(id, opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling TagsApi->update_tag: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| メモタグID | 
 **tag_params** | [**TagParams**](TagParams.md)| メモタグの更新 | [optional] 

### Return type

[**TagResponse**](TagResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json

