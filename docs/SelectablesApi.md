# UnofficialFreeeSdk::SelectablesApi

All URIs are relative to *https://api.freee.co.jp*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_forms_selectables**](SelectablesApi.md#get_forms_selectables) | **GET** /api/1/forms/selectables | フォーム用選択項目情報の取得



## get_forms_selectables

> SelectablesIndexResponse get_forms_selectables(company_id, opts)

フォーム用選択項目情報の取得

 <h2 id=\"\">概要</h2>  <p>指定した事業所のフォーム用選択項目情報を取得する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::SelectablesApi.new
company_id = 56 # Integer | 事業所ID
opts = {
  includes: 'includes_example' # String | 取得する項目(項目: account_item)
}

begin
  #フォーム用選択項目情報の取得
  result = api_instance.get_forms_selectables(company_id, opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling SelectablesApi->get_forms_selectables: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **company_id** | **Integer**| 事業所ID | 
 **includes** | **String**| 取得する項目(項目: account_item) | [optional] 

### Return type

[**SelectablesIndexResponse**](SelectablesIndexResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

