# UnofficialFreeeSdk::SectionsApi

All URIs are relative to *https://api.freee.co.jp*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_section**](SectionsApi.md#create_section) | **POST** /api/1/sections | 部門の作成
[**destroy_section**](SectionsApi.md#destroy_section) | **DELETE** /api/1/sections/{id} | 部門の削除
[**get_section**](SectionsApi.md#get_section) | **GET** /api/1/sections/{id} | 
[**get_sections**](SectionsApi.md#get_sections) | **GET** /api/1/sections | 部門一覧の取得
[**update_section**](SectionsApi.md#update_section) | **PUT** /api/1/sections/{id} | 部門の更新



## create_section

> SectionResponse create_section(opts)

部門の作成

 <h2 id=\"\">概要</h2>  <p>指定した事業所の部門を作成する</p>  <h2 id=\"_2\">レスポンスの例</h2>  <pre><code>// プレミアムプラン（個人）、ビジネスプラン（法人）、エンタープライズプラン（法人） {   &quot;section&quot; : {     &quot;id&quot; : 102,     &quot;company_id&quot; : 1,     &quot;name&quot; : &quot;開発部門&quot;,     &quot;shortcut1&quot; : &quot;DEVELOPER&quot;,     &quot;shortcut2&quot; : &quot;123&quot;,     &quot;indent_count&quot;: 1,     &quot;parent_id&quot;: 101   } } // それ以外のプラン {   &quot;section&quot; : {     &quot;id&quot; : 102,     &quot;company_id&quot; : 1,     &quot;name&quot; : &quot;開発部門&quot;,     &quot;shortcut1&quot; : &quot;DEVELOPER&quot;,     &quot;shortcut2&quot; : &quot;123&quot;   } }</code></pre> 

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::SectionsApi.new
opts = {
  section_params: UnofficialFreeeSdk::SectionParams.new # SectionParams | 部門の作成
}

begin
  #部門の作成
  result = api_instance.create_section(opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling SectionsApi->create_section: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **section_params** | [**SectionParams**](SectionParams.md)| 部門の作成 | [optional] 

### Return type

[**SectionResponse**](SectionResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json


## destroy_section

> destroy_section(id, company_id)

部門の削除

 <h2 id=\"\">概要</h2>  <p>指定した事業所の部門を削除する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::SectionsApi.new
id = 56 # Integer | 
company_id = 56 # Integer | 事業所ID

begin
  #部門の削除
  api_instance.destroy_section(id, company_id)
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling SectionsApi->destroy_section: #{e}"
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


## get_section

> SectionResponse get_section(id, company_id)



 <h2 id=\"\">概要</h2>  <p>指定した事業所の部門を参照する</p><h2 id=\"_2\">レスポンスの例</h2>  <pre><code>// プレミアムプラン（個人）、ビジネスプラン（法人）、エンタープライズプラン（法人） {   &quot;section&quot; : {     &quot;id&quot; : 102,     &quot;company_id&quot; : 1,     &quot;name&quot; : &quot;開発部門&quot;,     &quot;long_name&quot;: &quot;開発部門&quot;,     &quot;shortcut1&quot; : &quot;DEVELOPER&quot;,     &quot;shortcut2&quot; : &quot;123&quot;,     &quot;indent_count&quot;: 1,     &quot;parent_id&quot;: 101   } } // それ以外のプラン {   &quot;section&quot; : {     &quot;id&quot; : 102,     &quot;company_id&quot; : 1,     &quot;name&quot; : &quot;開発部門&quot;,     &quot;long_name&quot;: &quot;開発部門&quot;,     &quot;shortcut1&quot; : &quot;DEVELOPER&quot;,     &quot;shortcut2&quot; : &quot;123&quot;   } }</code></pre> 

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::SectionsApi.new
id = 56 # Integer | 部門ID
company_id = 56 # Integer | 事業所ID

begin
  result = api_instance.get_section(id, company_id)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling SectionsApi->get_section: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| 部門ID | 
 **company_id** | **Integer**| 事業所ID | 

### Return type

[**SectionResponse**](SectionResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_sections

> InlineResponse2002 get_sections(company_id)

部門一覧の取得

 <h2 id=\"\">概要</h2>  <p>指定した事業所の部門一覧を取得する</p>  <h2 id=\"_2\">レスポンスの例</h2>  <blockquote> <p>GET https://api.freee.co.jp/api/1/sections?company_id=1</p> </blockquote>  <pre><code>// プレミアムプラン（個人）、ビジネスプラン（法人）、エンタープライズプラン（法人） {   &quot;sections&quot; : [     {       &quot;id&quot; : 101,       &quot;company_id&quot; : 1,       &quot;name&quot; : &quot;開発部門&quot;,       &quot;long_name&quot;: &quot;開発部門&quot;,       &quot;shortcut1&quot; : &quot;DEVELOPER&quot;,       &quot;shortcut2&quot; : &quot;123&quot;,       &quot;indent_count&quot;: 1,       &quot;parent_id&quot;: 11     },     ...   ] } // それ以外のプラン {   &quot;sections&quot; : [     {       &quot;id&quot; : 101,       &quot;company_id&quot; : 1,       &quot;name&quot; : &quot;開発部門&quot;,       &quot;long_name&quot;: &quot;開発部門&quot;,       &quot;shortcut1&quot; : &quot;DEVELOPER&quot;,       &quot;shortcut2&quot; : &quot;123&quot;     },     ...   ] }</code></pre> 

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::SectionsApi.new
company_id = 56 # Integer | 事業所ID

begin
  #部門一覧の取得
  result = api_instance.get_sections(company_id)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling SectionsApi->get_sections: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **company_id** | **Integer**| 事業所ID | 

### Return type

[**InlineResponse2002**](InlineResponse2002.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_section

> SectionResponse update_section(id, opts)

部門の更新

 <h2 id=\"\">概要</h2>  <p>指定した事業所の部門を更新する</p><h2 id=\"_2\">レスポンスの例</h2>  <pre><code>// プレミアムプラン（個人）、ビジネスプラン（法人）、エンタープライズプラン（法人） {   &quot;section&quot; : {     &quot;id&quot; : 102,     &quot;company_id&quot; : 1,     &quot;name&quot; : &quot;開発部門&quot;,     &quot;long_name&quot;: &quot;開発部門&quot;,     &quot;shortcut1&quot; : &quot;DEVELOPER&quot;,     &quot;shortcut2&quot; : &quot;123&quot;,     &quot;indent_count&quot;: 1,     &quot;parent_id&quot;: 101   } } // それ以外のプラン {   &quot;section&quot; : {     &quot;id&quot; : 102,     &quot;company_id&quot; : 1,     &quot;name&quot; : &quot;開発部門&quot;,     &quot;long_name&quot;: &quot;開発部門&quot;,     &quot;shortcut1&quot; : &quot;DEVELOPER&quot;,     &quot;shortcut2&quot; : &quot;123&quot;   } }</code></pre> 

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::SectionsApi.new
id = 56 # Integer | 
opts = {
  section_params: UnofficialFreeeSdk::SectionParams.new # SectionParams | 部門の更新
}

begin
  #部門の更新
  result = api_instance.update_section(id, opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling SectionsApi->update_section: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**|  | 
 **section_params** | [**SectionParams**](SectionParams.md)| 部門の更新 | [optional] 

### Return type

[**SectionResponse**](SectionResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json

