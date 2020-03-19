# UnofficialFreeeSdk::InvoicesApi

All URIs are relative to *https://api.freee.co.jp*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_invoice**](InvoicesApi.md#create_invoice) | **POST** /api/1/invoices | 請求書の作成
[**destroy_invoice**](InvoicesApi.md#destroy_invoice) | **DELETE** /api/1/invoices/{id} | 請求書の削除
[**get_invoice**](InvoicesApi.md#get_invoice) | **GET** /api/1/invoices/{id} | 請求書の取得
[**get_invoices**](InvoicesApi.md#get_invoices) | **GET** /api/1/invoices | 請求書一覧の取得
[**update_invoice**](InvoicesApi.md#update_invoice) | **PUT** /api/1/invoices/{id} | 請求書の更新



## create_invoice

> InvoiceResponse create_invoice(opts)

請求書の作成

 <h2 id=\"\">概要</h2>  <p>指定した事業所の請求書を作成する</p>  <h2 id=\"_1\">注意点</h2> <ul> <li> <p>partner_code, partner_idはどちらかの指定が必須です。ただし両方同時に指定することはできません。</p> </li> <li> <p>請求書ステータス(invoice_status)を発行(issue)で利用した場合、請求内容の合計金額が0円以上になる必要があります。</p> </li> <li> <p>partner_codeを利用するには、事業所の設定から取引先コードの利用を有効にする必要があります。</p> </li> </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::InvoicesApi.new
opts = {
  invoice_create_params: UnofficialFreeeSdk::InvoiceCreateParams.new # InvoiceCreateParams | 請求書の作成
}

begin
  #請求書の作成
  result = api_instance.create_invoice(opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling InvoicesApi->create_invoice: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invoice_create_params** | [**InvoiceCreateParams**](InvoiceCreateParams.md)| 請求書の作成 | [optional] 

### Return type

[**InvoiceResponse**](InvoiceResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json


## destroy_invoice

> destroy_invoice(id, company_id)

請求書の削除

 <h2 id=\"\">概要</h2>  <p>指定した事業所の請求書を削除する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::InvoicesApi.new
id = 56 # Integer | 
company_id = 56 # Integer | 事業所ID

begin
  #請求書の削除
  api_instance.destroy_invoice(id, company_id)
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling InvoicesApi->destroy_invoice: #{e}"
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


## get_invoice

> InvoiceResponse get_invoice(company_id, id)

請求書の取得

 <h2 id=\"\">概要</h2>  <p>指定した事業所の請求書詳細を取得する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::InvoicesApi.new
company_id = 56 # Integer | 事業所ID
id = 56 # Integer | 請求書ID

begin
  #請求書の取得
  result = api_instance.get_invoice(company_id, id)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling InvoicesApi->get_invoice: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **company_id** | **Integer**| 事業所ID | 
 **id** | **Integer**| 請求書ID | 

### Return type

[**InvoiceResponse**](InvoiceResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_invoices

> InlineResponse2003 get_invoices(company_id, opts)

請求書一覧の取得

 <h2 id=\"\">概要</h2>  <p>指定した事業所の請求書一覧を取得する</p> 

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::InvoicesApi.new
company_id = 56 # Integer | 事業所ID
opts = {
  partner_id: 56, # Integer | 取引先IDで絞込
  partner_code: 'partner_code_example', # String | 取引先コードで絞込
  issue_date_start: 'issue_date_start_example', # String | 請求日の開始日(yyyy-mm-dd)
  issue_date_end: 'issue_date_end_example', # String | 請求日の終了日(yyyy-mm-dd)
  due_date_start: 'due_date_start_example', # String | 期日の開始日(yyyy-mm-dd)
  due_date_end: 'due_date_end_example', # String | 期日の終了日(yyyy-mm-dd)
  invoice_number: 'invoice_number_example', # String | 請求書番号
  description: 'description_example', # String | 概要
  invoice_status: 'invoice_status_example', # String | 請求書ステータス  (draft: 下書き, applying: 申請中, remanded: 差し戻し, rejected: 却下, approved: 承認済み, issued: 発行済み, unsubmitted: 送付待ち)
  payment_status: 'payment_status_example', # String | 入金ステータス  (unsettled: 入金待ち, settled: 入金済み)
  offset: 56, # Integer | 取得レコードのオフセット (デフォルト: 0)
  limit: 56 # Integer | 取得レコードの件数 (デフォルト: 20, 最大: 100) 
}

begin
  #請求書一覧の取得
  result = api_instance.get_invoices(company_id, opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling InvoicesApi->get_invoices: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **company_id** | **Integer**| 事業所ID | 
 **partner_id** | **Integer**| 取引先IDで絞込 | [optional] 
 **partner_code** | **String**| 取引先コードで絞込 | [optional] 
 **issue_date_start** | **String**| 請求日の開始日(yyyy-mm-dd) | [optional] 
 **issue_date_end** | **String**| 請求日の終了日(yyyy-mm-dd) | [optional] 
 **due_date_start** | **String**| 期日の開始日(yyyy-mm-dd) | [optional] 
 **due_date_end** | **String**| 期日の終了日(yyyy-mm-dd) | [optional] 
 **invoice_number** | **String**| 請求書番号 | [optional] 
 **description** | **String**| 概要 | [optional] 
 **invoice_status** | **String**| 請求書ステータス  (draft: 下書き, applying: 申請中, remanded: 差し戻し, rejected: 却下, approved: 承認済み, issued: 発行済み, unsubmitted: 送付待ち) | [optional] 
 **payment_status** | **String**| 入金ステータス  (unsettled: 入金待ち, settled: 入金済み) | [optional] 
 **offset** | **Integer**| 取得レコードのオフセット (デフォルト: 0) | [optional] 
 **limit** | **Integer**| 取得レコードの件数 (デフォルト: 20, 最大: 100)  | [optional] 

### Return type

[**InlineResponse2003**](InlineResponse2003.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_invoice

> InvoiceResponse update_invoice(id, opts)

請求書の更新

 <h2 id=\"\">概要</h2>  <p>指定した事業所の請求書を更新する</p>  <h2 id=\"_1\">注意点</h2> <ul> <li> <p>入金済みの請求書に対する金額関連の変更はできません。</p> </li> <li> <p>請求書ステータスは確定(issue)のみ指定可能です。請求書ステータスを確定する時のみ指定してください。</p> </li> <li> <p>請求書WFを利用している場合、承認済み請求書は承認権限を持たないユーザーでは更新できません。</p> </li> <li> <p>更新後の請求書ステータス(invoice_status)が下書き以外の場合、請求内容の合計金額が0円以上になる必要があります。</p> </li> <li> <p>partner_code, partner_idを両方同時に指定することはできません。</p> </li> <li> <p>partner_codeを利用するには、事業所の設定から取引先コードの利用を有効にする必要があります。</p> </li> </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::InvoicesApi.new
id = 56 # Integer | 請求書ID
opts = {
  invoice_update_params: UnofficialFreeeSdk::InvoiceUpdateParams.new # InvoiceUpdateParams | 請求書の更新
}

begin
  #請求書の更新
  result = api_instance.update_invoice(id, opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling InvoicesApi->update_invoice: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| 請求書ID | 
 **invoice_update_params** | [**InvoiceUpdateParams**](InvoiceUpdateParams.md)| 請求書の更新 | [optional] 

### Return type

[**InvoiceResponse**](InvoiceResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json

