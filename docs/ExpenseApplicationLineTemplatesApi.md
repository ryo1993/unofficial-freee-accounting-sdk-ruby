# UnofficialFreeeSdk::ExpenseApplicationLineTemplatesApi

All URIs are relative to *https://api.freee.co.jp*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_expense_application_line_template**](ExpenseApplicationLineTemplatesApi.md#create_expense_application_line_template) | **POST** /api/1/expense_application_line_templates | 経費科目の作成
[**destroy_expense_application_line_template**](ExpenseApplicationLineTemplatesApi.md#destroy_expense_application_line_template) | **DELETE** /api/1/expense_application_line_templates/{id} | 経費科目の削除
[**get_expense_application_line_template**](ExpenseApplicationLineTemplatesApi.md#get_expense_application_line_template) | **GET** /api/1/expense_application_line_templates/{id} | 経費科目の取得
[**get_expense_application_line_templates**](ExpenseApplicationLineTemplatesApi.md#get_expense_application_line_templates) | **GET** /api/1/expense_application_line_templates | 経費科目一覧の取得
[**update_expense_application_line_template**](ExpenseApplicationLineTemplatesApi.md#update_expense_application_line_template) | **PUT** /api/1/expense_application_line_templates/{id} | 経費科目の更新



## create_expense_application_line_template

> ExpenseApplicationLineTemplateResponse create_expense_application_line_template(expense_application_line_template_params)

経費科目の作成

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::ExpenseApplicationLineTemplatesApi.new
expense_application_line_template_params = UnofficialFreeeSdk::ExpenseApplicationLineTemplateParams.new # ExpenseApplicationLineTemplateParams | 経費科目の作成

begin
  #経費科目の作成
  result = api_instance.create_expense_application_line_template(expense_application_line_template_params)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling ExpenseApplicationLineTemplatesApi->create_expense_application_line_template: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **expense_application_line_template_params** | [**ExpenseApplicationLineTemplateParams**](ExpenseApplicationLineTemplateParams.md)| 経費科目の作成 | 

### Return type

[**ExpenseApplicationLineTemplateResponse**](ExpenseApplicationLineTemplateResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json


## destroy_expense_application_line_template

> destroy_expense_application_line_template(id, company_id)

経費科目の削除

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::ExpenseApplicationLineTemplatesApi.new
id = 56 # Integer | 経費科目ID
company_id = 56 # Integer | 事業所ID

begin
  #経費科目の削除
  api_instance.destroy_expense_application_line_template(id, company_id)
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling ExpenseApplicationLineTemplatesApi->destroy_expense_application_line_template: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| 経費科目ID | 
 **company_id** | **Integer**| 事業所ID | 

### Return type

nil (empty response body)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_expense_application_line_template

> ExpenseApplicationLineTemplateResponse get_expense_application_line_template(id, company_id)

経費科目の取得

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::ExpenseApplicationLineTemplatesApi.new
id = 56 # Integer | 経費科目ID
company_id = 56 # Integer | 事業所ID

begin
  #経費科目の取得
  result = api_instance.get_expense_application_line_template(id, company_id)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling ExpenseApplicationLineTemplatesApi->get_expense_application_line_template: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| 経費科目ID | 
 **company_id** | **Integer**| 事業所ID | 

### Return type

[**ExpenseApplicationLineTemplateResponse**](ExpenseApplicationLineTemplateResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_expense_application_line_templates

> InlineResponse20018 get_expense_application_line_templates(company_id, opts)

経費科目一覧の取得

 <h2 id=\"\">概要</h2>  <p>指定した事業所の経費科目一覧を取得する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::ExpenseApplicationLineTemplatesApi.new
company_id = 56 # Integer | 事業所ID
opts = {
  offset: 56, # Integer | 取得レコードのオフセット (デフォルト: 0)
  limit: 56 # Integer | 取得レコードの件数 (デフォルト: 20, 最小: 1, 最大: 100)
}

begin
  #経費科目一覧の取得
  result = api_instance.get_expense_application_line_templates(company_id, opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling ExpenseApplicationLineTemplatesApi->get_expense_application_line_templates: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **company_id** | **Integer**| 事業所ID | 
 **offset** | **Integer**| 取得レコードのオフセット (デフォルト: 0) | [optional] 
 **limit** | **Integer**| 取得レコードの件数 (デフォルト: 20, 最小: 1, 最大: 100) | [optional] 

### Return type

[**InlineResponse20018**](InlineResponse20018.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_expense_application_line_template

> ExpenseApplicationLineTemplateResponse update_expense_application_line_template(id, expense_application_line_template_params)

経費科目の更新

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::ExpenseApplicationLineTemplatesApi.new
id = 56 # Integer | 経費科目ID
expense_application_line_template_params = UnofficialFreeeSdk::ExpenseApplicationLineTemplateParams.new # ExpenseApplicationLineTemplateParams | 経費科目の更新

begin
  #経費科目の更新
  result = api_instance.update_expense_application_line_template(id, expense_application_line_template_params)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling ExpenseApplicationLineTemplatesApi->update_expense_application_line_template: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| 経費科目ID | 
 **expense_application_line_template_params** | [**ExpenseApplicationLineTemplateParams**](ExpenseApplicationLineTemplateParams.md)| 経費科目の更新 | 

### Return type

[**ExpenseApplicationLineTemplateResponse**](ExpenseApplicationLineTemplateResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json

