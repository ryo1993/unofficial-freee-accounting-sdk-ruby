# UnofficialFreeeSdk::TaxesApi

All URIs are relative to *https://api.freee.co.jp*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_tax_code**](TaxesApi.md#get_tax_code) | **GET** /api/1/taxes/codes/{code} | 税区分コードの取得
[**get_tax_codes**](TaxesApi.md#get_tax_codes) | **GET** /api/1/taxes/codes | 税区分コード一覧の取得
[**get_taxes_companies**](TaxesApi.md#get_taxes_companies) | **GET** /api/1/taxes/companies/{company_id} | 税区分コード詳細一覧の取得



## get_tax_code

> TaxResponse get_tax_code(code)

税区分コードの取得

 <h2 id=\"\">概要</h2>  <p>税区分コードを取得する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::TaxesApi.new
code = 56 # Integer | 税区分コード

begin
  #税区分コードの取得
  result = api_instance.get_tax_code(code)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling TaxesApi->get_tax_code: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **code** | **Integer**| 税区分コード | 

### Return type

[**TaxResponse**](TaxResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_tax_codes

> InlineResponse20010 get_tax_codes

税区分コード一覧の取得

 <h2 id=\"\">概要</h2>  <p>税区分コード一覧を取得する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::TaxesApi.new

begin
  #税区分コード一覧の取得
  result = api_instance.get_tax_codes
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling TaxesApi->get_tax_codes: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**InlineResponse20010**](InlineResponse20010.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_taxes_companies

> InlineResponse20011 get_taxes_companies(company_id)

税区分コード詳細一覧の取得

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::TaxesApi.new
company_id = 56 # Integer | 事業所ID

begin
  #税区分コード詳細一覧の取得
  result = api_instance.get_taxes_companies(company_id)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling TaxesApi->get_taxes_companies: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **company_id** | **Integer**| 事業所ID | 

### Return type

[**InlineResponse20011**](InlineResponse20011.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

