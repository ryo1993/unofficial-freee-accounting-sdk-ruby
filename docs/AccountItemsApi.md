# UnofficialFreeeSdk::AccountItemsApi

All URIs are relative to *https://api.freee.co.jp*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_account_item**](AccountItemsApi.md#create_account_item) | **POST** /api/1/account_items | 勘定科目の作成
[**destroy_account_item**](AccountItemsApi.md#destroy_account_item) | **DELETE** /api/1/account_items/{id} | 勘定科目の削除
[**get_account_item**](AccountItemsApi.md#get_account_item) | **GET** /api/1/account_items/{id} | 勘定科目の詳細情報の取得
[**get_account_items**](AccountItemsApi.md#get_account_items) | **GET** /api/1/account_items | 勘定科目一覧の取得
[**update_account_item**](AccountItemsApi.md#update_account_item) | **PUT** /api/1/account_items/{id} | 勘定科目の更新



## create_account_item

> AccountItemResponse create_account_item(account_item_params)

勘定科目の作成

 <h2 id=\"\">概要</h2>  <p>指定した事業所の勘定科目を作成する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::AccountItemsApi.new
account_item_params = UnofficialFreeeSdk::AccountItemParams.new # AccountItemParams | 勘定科目の作成

begin
  #勘定科目の作成
  result = api_instance.create_account_item(account_item_params)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling AccountItemsApi->create_account_item: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_item_params** | [**AccountItemParams**](AccountItemParams.md)| 勘定科目の作成 | 

### Return type

[**AccountItemResponse**](AccountItemResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json


## destroy_account_item

> destroy_account_item(id, company_id)

勘定科目の削除

 <h2 id=\"\">概要</h2>  <p>指定した勘定科目を削除する</p> <h2 id=\"\">注意点</h2> <ul> <li>削除できる勘定科目は、追加で作成したカスタム勘定項目のみです。</li> <li>デフォルトで存在する勘定科目や口座の勘定科目は削除できません。</li></ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::AccountItemsApi.new
id = 56 # Integer | 
company_id = 56 # Integer | 事業所ID

begin
  #勘定科目の削除
  api_instance.destroy_account_item(id, company_id)
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling AccountItemsApi->destroy_account_item: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**|  | 
 **company_id** | **Integer**| 事業所ID | 

### Return type

nil (empty response body)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_account_item

> AccountItemResponse get_account_item(company_id, id)

勘定科目の詳細情報の取得

 <h2 id=\"\">概要</h2>  <p>指定した勘定科目の詳細を取得する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::AccountItemsApi.new
company_id = 56 # Integer | 事業所ID
id = 56 # Integer | 勘定科目ID

begin
  #勘定科目の詳細情報の取得
  result = api_instance.get_account_item(company_id, id)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling AccountItemsApi->get_account_item: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **company_id** | **Integer**| 事業所ID | 
 **id** | **Integer**| 勘定科目ID | 

### Return type

[**AccountItemResponse**](AccountItemResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_account_items

> AccountItemsResponse get_account_items(company_id, opts)

勘定科目一覧の取得

 <h2 id=\"\">概要</h2>  <p>指定した事業所の勘定科目一覧を取得する</p>  <h2 id=\"_2\">定義</h2>  <ul> <li>default_tax_id : デフォルト設定がされている税区分ID</li>  <li>default_tax_code : リクエストした日時を基準とした税区分コード</li> </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::AccountItemsApi.new
company_id = 56 # Integer | 事業所ID
opts = {
  base_date: 'base_date_example' # String | 基準日:指定した場合、勘定科目に紐づく税区分(default_tax_code)が、基準日の税率に基づいて返ります。
}

begin
  #勘定科目一覧の取得
  result = api_instance.get_account_items(company_id, opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling AccountItemsApi->get_account_items: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **company_id** | **Integer**| 事業所ID | 
 **base_date** | **String**| 基準日:指定した場合、勘定科目に紐づく税区分(default_tax_code)が、基準日の税率に基づいて返ります。 | [optional] 

### Return type

[**AccountItemsResponse**](AccountItemsResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_account_item

> AccountItemResponse update_account_item(id, account_item_params)

勘定科目の更新

 <h2 id=\"\">概要</h2>  <p>勘定科目を更新する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::AccountItemsApi.new
id = 56 # Integer | 
account_item_params = UnofficialFreeeSdk::AccountItemParams.new # AccountItemParams | 勘定科目の更新

begin
  #勘定科目の更新
  result = api_instance.update_account_item(id, account_item_params)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling AccountItemsApi->update_account_item: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**|  | 
 **account_item_params** | [**AccountItemParams**](AccountItemParams.md)| 勘定科目の更新 | 

### Return type

[**AccountItemResponse**](AccountItemResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json

