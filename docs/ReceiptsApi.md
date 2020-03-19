# UnofficialFreeeSdk::ReceiptsApi

All URIs are relative to *https://api.freee.co.jp*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_receipt**](ReceiptsApi.md#create_receipt) | **POST** /api/1/receipts | ファイルボックス 証憑ファイルアップロード
[**destroy_receipt**](ReceiptsApi.md#destroy_receipt) | **DELETE** /api/1/receipts/{id} | ファイルボックス 証憑ファイルを削除する
[**get_receipt**](ReceiptsApi.md#get_receipt) | **GET** /api/1/receipts/{id} | ファイルボックス 証憑ファイルの取得
[**get_receipts**](ReceiptsApi.md#get_receipts) | **GET** /api/1/receipts | ファイルボックス 証憑ファイル一覧の取得
[**update_receipt**](ReceiptsApi.md#update_receipt) | **PUT** /api/1/receipts/{id} | ファイルボックス 証憑ファイル情報更新



## create_receipt

> ReceiptResponse create_receipt(receipt_create_params)

ファイルボックス 証憑ファイルアップロード

 <h2 id=\"\">概要</h2>  <p>ファイルボックスに証憑ファイルをアップロードする</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::ReceiptsApi.new
receipt_create_params = UnofficialFreeeSdk::ReceiptCreateParams.new # ReceiptCreateParams | 

begin
  #ファイルボックス 証憑ファイルアップロード
  result = api_instance.create_receipt(receipt_create_params)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling ReceiptsApi->create_receipt: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **receipt_create_params** | [**ReceiptCreateParams**](ReceiptCreateParams.md)|  | 

### Return type

[**ReceiptResponse**](ReceiptResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## destroy_receipt

> destroy_receipt(id, company_id)

ファイルボックス 証憑ファイルを削除する

 <h2 id=\"\">概要</h2>  <p>ファイルボックスの証憑ファイルを削除する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::ReceiptsApi.new
id = 56 # Integer | 証憑ID
company_id = 56 # Integer | 事業所ID

begin
  #ファイルボックス 証憑ファイルを削除する
  api_instance.destroy_receipt(id, company_id)
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling ReceiptsApi->destroy_receipt: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| 証憑ID | 
 **company_id** | **Integer**| 事業所ID | 

### Return type

nil (empty response body)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_receipt

> ReceiptResponse get_receipt(id, company_id)

ファイルボックス 証憑ファイルの取得

 <h2 id=\"\">概要</h2>  <p>指定した事業所のファイルボックス 証憑ファイルを取得する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::ReceiptsApi.new
id = 56 # Integer | 証憑ID
company_id = 56 # Integer | 事業所ID

begin
  #ファイルボックス 証憑ファイルの取得
  result = api_instance.get_receipt(id, company_id)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling ReceiptsApi->get_receipt: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| 証憑ID | 
 **company_id** | **Integer**| 事業所ID | 

### Return type

[**ReceiptResponse**](ReceiptResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_receipts

> InlineResponse20016 get_receipts(company_id, start_date, end_date, opts)

ファイルボックス 証憑ファイル一覧の取得

 <h2 id=\"\">概要</h2>  <p>指定した事業所のファイルボックス 証憑ファイル一覧を取得する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::ReceiptsApi.new
company_id = 56 # Integer | 事業所ID
start_date = 'start_date_example' # String | アップロード日 (yyyy-mm-dd)
end_date = 'end_date_example' # String | アップロード日 (yyyy-mm-dd)
opts = {
  user_name: 'user_name_example', # String | アップロードしたユーザー名、メールアドレス
  number: 56, # Integer | アップロードファイルNo
  comment_type: 'comment_type_example', # String | posted:コメントあり, raised:未解決, resolved:解決済
  comment_important: true, # Boolean | trueの時、重要コメント付きが対象
  category: 'category_example', # String | all:すべて、without_deal:未登録、with_expense_application_line:経費申請中, with_deal:登録済み、ignored:無視
  offset: 56, # Integer | 取得レコードのオフセット (デフォルト: 0)
  limit: 56 # Integer | 取得レコードの件数 (デフォルト: 50, 最小: 1, 最大: 3000)
}

begin
  #ファイルボックス 証憑ファイル一覧の取得
  result = api_instance.get_receipts(company_id, start_date, end_date, opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling ReceiptsApi->get_receipts: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **company_id** | **Integer**| 事業所ID | 
 **start_date** | **String**| アップロード日 (yyyy-mm-dd) | 
 **end_date** | **String**| アップロード日 (yyyy-mm-dd) | 
 **user_name** | **String**| アップロードしたユーザー名、メールアドレス | [optional] 
 **number** | **Integer**| アップロードファイルNo | [optional] 
 **comment_type** | **String**| posted:コメントあり, raised:未解決, resolved:解決済 | [optional] 
 **comment_important** | **Boolean**| trueの時、重要コメント付きが対象 | [optional] 
 **category** | **String**| all:すべて、without_deal:未登録、with_expense_application_line:経費申請中, with_deal:登録済み、ignored:無視 | [optional] 
 **offset** | **Integer**| 取得レコードのオフセット (デフォルト: 0) | [optional] 
 **limit** | **Integer**| 取得レコードの件数 (デフォルト: 50, 最小: 1, 最大: 3000) | [optional] 

### Return type

[**InlineResponse20016**](InlineResponse20016.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_receipt

> ReceiptResponse update_receipt(id, receipt_update_params)

ファイルボックス 証憑ファイル情報更新

 <h2 id=\"\">概要</h2>  <p>ファイルボックスの証憑ファイル情報を更新する</p> <h2 id=\"_2\">注意点</h2> <ul>   <li>本APIでは、証憑ファイルの再アップロードはできません。</li> </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::ReceiptsApi.new
id = 56 # Integer | 証憑ID
receipt_update_params = UnofficialFreeeSdk::ReceiptUpdateParams.new # ReceiptUpdateParams | 経費申請の更新

begin
  #ファイルボックス 証憑ファイル情報更新
  result = api_instance.update_receipt(id, receipt_update_params)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling ReceiptsApi->update_receipt: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| 証憑ID | 
 **receipt_update_params** | [**ReceiptUpdateParams**](ReceiptUpdateParams.md)| 経費申請の更新 | 

### Return type

[**ReceiptResponse**](ReceiptResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json

