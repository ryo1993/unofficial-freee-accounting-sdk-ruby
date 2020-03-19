# UnofficialFreeeSdk::QuotationsApi

All URIs are relative to *https://api.freee.co.jp*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_quotation**](QuotationsApi.md#create_quotation) | **POST** /api/1/quotations | 見積書の作成
[**destroy_quotation**](QuotationsApi.md#destroy_quotation) | **DELETE** /api/1/quotations/{id} | 見積書の削除
[**get_quotation**](QuotationsApi.md#get_quotation) | **GET** /api/1/quotations/{id} | 見積書の取得
[**get_quotations**](QuotationsApi.md#get_quotations) | **GET** /api/1/quotations | 見積書一覧の取得
[**update_quotation**](QuotationsApi.md#update_quotation) | **PUT** /api/1/quotations/{id} | 見積書の更新



## create_quotation

> QuotationResponse create_quotation(opts)

見積書の作成

 <h2 id=\"\">概要</h2>  <p>指定した事業所の見積書を作成する</p>  <h2 id=\"_1\">注意点</h2> <ul> <li> <p>partner_code, partner_idはどちらかの指定が必須です。ただし両方同時に指定することはできません。</p> </li> <li> <p>partner_codeを利用するには、事業所の設定から取引先コードの利用を有効にする必要があります。</p> </li> </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::QuotationsApi.new
opts = {
  quotation_create_params: UnofficialFreeeSdk::QuotationCreateParams.new # QuotationCreateParams | 見積書の作成
}

begin
  #見積書の作成
  result = api_instance.create_quotation(opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling QuotationsApi->create_quotation: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **quotation_create_params** | [**QuotationCreateParams**](QuotationCreateParams.md)| 見積書の作成 | [optional] 

### Return type

[**QuotationResponse**](QuotationResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json


## destroy_quotation

> destroy_quotation(id, company_id)

見積書の削除

 <h2 id=\"\">概要</h2>  <p>指定した事業所の見積書を削除する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::QuotationsApi.new
id = 56 # Integer | 
company_id = 56 # Integer | 事業所ID

begin
  #見積書の削除
  api_instance.destroy_quotation(id, company_id)
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling QuotationsApi->destroy_quotation: #{e}"
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


## get_quotation

> QuotationResponse get_quotation(company_id, id)

見積書の取得

 <h2 id=\"\">概要</h2>  <p>指定した事業所の見積書詳細を取得する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::QuotationsApi.new
company_id = 56 # Integer | 事業所ID
id = 56 # Integer | 見積書ID

begin
  #見積書の取得
  result = api_instance.get_quotation(company_id, id)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling QuotationsApi->get_quotation: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **company_id** | **Integer**| 事業所ID | 
 **id** | **Integer**| 見積書ID | 

### Return type

[**QuotationResponse**](QuotationResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_quotations

> InlineResponse2004 get_quotations(company_id, opts)

見積書一覧の取得

 <h2 id=\"\">概要</h2>  <p>指定した事業所の見積書一覧を取得する</p> 

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::QuotationsApi.new
company_id = 56 # Integer | 事業所ID
opts = {
  partner_id: 56, # Integer | 取引先IDで絞込
  partner_code: 'partner_code_example', # String | 取引先コードで絞込
  start_issue_date: 'start_issue_date_example', # String | 見積日の開始日(yyyy-mm-dd)
  end_issue_date: 'end_issue_date_example', # String | 見積日の終了日(yyyy-mm-dd)
  quotation_number: 'quotation_number_example', # String | 見積書番号
  description: 'description_example', # String | 概要
  quotation_status: 'quotation_status_example', # String | 見積書ステータス  (unsubmitted: 送付待ち, submitted: 送付済み, all: 全て)
  offset: 56, # Integer | 取得レコードのオフセット (デフォルト: 0)
  limit: 56 # Integer | 取得レコードの件数 (デフォルト: 20, 最大: 100) 
}

begin
  #見積書一覧の取得
  result = api_instance.get_quotations(company_id, opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling QuotationsApi->get_quotations: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **company_id** | **Integer**| 事業所ID | 
 **partner_id** | **Integer**| 取引先IDで絞込 | [optional] 
 **partner_code** | **String**| 取引先コードで絞込 | [optional] 
 **start_issue_date** | **String**| 見積日の開始日(yyyy-mm-dd) | [optional] 
 **end_issue_date** | **String**| 見積日の終了日(yyyy-mm-dd) | [optional] 
 **quotation_number** | **String**| 見積書番号 | [optional] 
 **description** | **String**| 概要 | [optional] 
 **quotation_status** | **String**| 見積書ステータス  (unsubmitted: 送付待ち, submitted: 送付済み, all: 全て) | [optional] 
 **offset** | **Integer**| 取得レコードのオフセット (デフォルト: 0) | [optional] 
 **limit** | **Integer**| 取得レコードの件数 (デフォルト: 20, 最大: 100)  | [optional] 

### Return type

[**InlineResponse2004**](InlineResponse2004.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_quotation

> QuotationResponse update_quotation(id, opts)

見積書の更新

 <h2 id=\"\">概要</h2>  <p>指定した事業所の見積書を更新する</p>  <h2 id=\"_1\">注意点</h2> <ul> <li> <p>partner_code, partner_idを両方同時に指定することはできません。</p> </li> <li> <p>partner_codeを利用するには、事業所の設定から取引先コードの利用を有効にする必要があります。</p> </li> </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::QuotationsApi.new
id = 56 # Integer | 見積書ID
opts = {
  quotation_update_params: UnofficialFreeeSdk::QuotationUpdateParams.new # QuotationUpdateParams | 見積書の更新
}

begin
  #見積書の更新
  result = api_instance.update_quotation(id, opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling QuotationsApi->update_quotation: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| 見積書ID | 
 **quotation_update_params** | [**QuotationUpdateParams**](QuotationUpdateParams.md)| 見積書の更新 | [optional] 

### Return type

[**QuotationResponse**](QuotationResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json

