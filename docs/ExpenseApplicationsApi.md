# UnofficialFreeeSdk::ExpenseApplicationsApi

All URIs are relative to *https://api.freee.co.jp*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_expense_application**](ExpenseApplicationsApi.md#create_expense_application) | **POST** /api/1/expense_applications | 経費申請の作成
[**destroy_expense_application**](ExpenseApplicationsApi.md#destroy_expense_application) | **DELETE** /api/1/expense_applications/{id} | 経費申請の削除
[**get_expense_application**](ExpenseApplicationsApi.md#get_expense_application) | **GET** /api/1/expense_applications/{id} | 経費申請詳細の取得
[**get_expense_applications**](ExpenseApplicationsApi.md#get_expense_applications) | **GET** /api/1/expense_applications | 経費申請一覧の取得
[**update_expense_application**](ExpenseApplicationsApi.md#update_expense_application) | **PUT** /api/1/expense_applications/{id} | 経費申請の更新



## create_expense_application

> ExpenseApplicationResponse create_expense_application(opts)

経費申請の作成

 <h2 id=\"_1\">概要</h2>  <p>指定した事業所の経費申請を作成する</p>  <h2 id=\"_2\">注意点</h2> <ul>   <li>本APIでは、経費申請の下書きを作成することができます。申請作業はWebから行ってください。</li>   <li>現在、申請経路はWeb上からのみ入力できます。Web上での申請時に指定してください。</li>   <li>申請時には、申請タイトル(title)に加え、申請日(issue_date)、項目行については金額(amount)、日付(transaction_date)、内容(description)が必須項目となります。申請時の業務効率化のため、API入力をお勧めします。</li>   <li>個人アカウントの場合は、プレミアムプランでご利用できます。</li>   <li>法人アカウントの場合は、ベーシックプラン、プロフェッショナルプラン、エンタープライズプランでご利用できます。</li> </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::ExpenseApplicationsApi.new
opts = {
  expense_application_create_params: UnofficialFreeeSdk::ExpenseApplicationCreateParams.new # ExpenseApplicationCreateParams | 経費申請の作成
}

begin
  #経費申請の作成
  result = api_instance.create_expense_application(opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling ExpenseApplicationsApi->create_expense_application: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **expense_application_create_params** | [**ExpenseApplicationCreateParams**](ExpenseApplicationCreateParams.md)| 経費申請の作成 | [optional] 

### Return type

[**ExpenseApplicationResponse**](ExpenseApplicationResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json


## destroy_expense_application

> destroy_expense_application(id, company_id)

経費申請の削除

 <h2 id=\"\">概要</h2>  <p>指定した事業所の経費申請を削除する</p>  <h2 id=\"_2\">注意点</h2> <ul>   <li>個人アカウントの場合は、プレミアムプランでご利用できます。</li>   <li>法人アカウントの場合は、ベーシックプラン、プロフェッショナルプラン、エンタープライズプランでご利用できます。</li> </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::ExpenseApplicationsApi.new
id = 56 # Integer | 
company_id = 56 # Integer | 事業所ID

begin
  #経費申請の削除
  api_instance.destroy_expense_application(id, company_id)
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling ExpenseApplicationsApi->destroy_expense_application: #{e}"
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


## get_expense_application

> ExpenseApplicationResponse get_expense_application(id, company_id)

経費申請詳細の取得

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::ExpenseApplicationsApi.new
id = 56 # Integer | 経費申請ID
company_id = 56 # Integer | 事業所ID

begin
  #経費申請詳細の取得
  result = api_instance.get_expense_application(id, company_id)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling ExpenseApplicationsApi->get_expense_application: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| 経費申請ID | 
 **company_id** | **Integer**| 事業所ID | 

### Return type

[**ExpenseApplicationResponse**](ExpenseApplicationResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_expense_applications

> InlineResponse20017 get_expense_applications(company_id, opts)

経費申請一覧の取得

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::ExpenseApplicationsApi.new
company_id = 56 # Integer | 事業所ID
opts = {
  offset: 56, # Integer | 取得レコードのオフセット (デフォルト: 0)
  limit: 56 # Integer | 取得レコードの件数 (デフォルト: 50, 最小: 1, 最大: 500)
}

begin
  #経費申請一覧の取得
  result = api_instance.get_expense_applications(company_id, opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling ExpenseApplicationsApi->get_expense_applications: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **company_id** | **Integer**| 事業所ID | 
 **offset** | **Integer**| 取得レコードのオフセット (デフォルト: 0) | [optional] 
 **limit** | **Integer**| 取得レコードの件数 (デフォルト: 50, 最小: 1, 最大: 500) | [optional] 

### Return type

[**InlineResponse20017**](InlineResponse20017.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_expense_application

> ExpenseApplicationResponse update_expense_application(id, opts)

経費申請の更新

 <h2 id=\"\">概要</h2>  <p>指定した事業所の経費申請を更新する</p>  <h2 id=\"_2\">注意点</h2> <ul>   <li>本APIでは、経費申請の下書きを更新することができます。申請作業はWebから行ってください。</li>   <li>現在、申請経路はWeb上からのみ入力できます。Web上での申請時に指定してください。</li>   <li>申請時には、申請タイトル(title)に加え、申請日(issue_date)、項目行については金額(amount)、日付(transaction_date)、内容(description)が必須項目となります。申請時の業務効率化のため、API入力をお勧めします。</li>   <li>個人アカウントの場合は、プレミアムプランでご利用できます。</li>   <li>法人アカウントの場合は、ベーシックプラン、プロフェッショナルプラン、エンタープライズプランでご利用できます。</li> </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::ExpenseApplicationsApi.new
id = 56 # Integer | 
opts = {
  expense_application_update_params: UnofficialFreeeSdk::ExpenseApplicationUpdateParams.new # ExpenseApplicationUpdateParams | 経費申請の更新
}

begin
  #経費申請の更新
  result = api_instance.update_expense_application(id, opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling ExpenseApplicationsApi->update_expense_application: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**|  | 
 **expense_application_update_params** | [**ExpenseApplicationUpdateParams**](ExpenseApplicationUpdateParams.md)| 経費申請の更新 | [optional] 

### Return type

[**ExpenseApplicationResponse**](ExpenseApplicationResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json

