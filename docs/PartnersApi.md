# UnofficialFreeeSdk::PartnersApi

All URIs are relative to *https://api.freee.co.jp*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_partner**](PartnersApi.md#create_partner) | **POST** /api/1/partners | 取引先の作成
[**destroy_partner**](PartnersApi.md#destroy_partner) | **DELETE** /api/1/partners/{id} | 取引先の削除
[**get_partner**](PartnersApi.md#get_partner) | **GET** /api/1/partners/{id} | 取引先の取得
[**get_partners**](PartnersApi.md#get_partners) | **GET** /api/1/partners | 取引先一覧の取得
[**update_partner**](PartnersApi.md#update_partner) | **PUT** /api/1/partners/{id} | 取引先の更新
[**update_partner_by_code**](PartnersApi.md#update_partner_by_code) | **PUT** /api/1/partners/code/{code} | 取引先の更新



## create_partner

> PartnerResponse create_partner(partner_create_params)

取引先の作成

 <h2 id=\"\">概要</h2>  <p>指定した事業所の取引先を作成する</p> <ul> <li>codeを利用するには、事業所の設定から取引先コードの利用を有効にする必要があります。</li> <li>取引先コードの利用を有効にしている場合は、codeの指定は必須です。</li></ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::PartnersApi.new
partner_create_params = UnofficialFreeeSdk::PartnerCreateParams.new # PartnerCreateParams | 取引先の作成

begin
  #取引先の作成
  result = api_instance.create_partner(partner_create_params)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling PartnersApi->create_partner: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **partner_create_params** | [**PartnerCreateParams**](PartnerCreateParams.md)| 取引先の作成 | 

### Return type

[**PartnerResponse**](PartnerResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json


## destroy_partner

> destroy_partner(id, company_id)

取引先の削除

 <h2 id=\"\">概要</h2>  <p>指定した事業所の取引先を削除する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::PartnersApi.new
id = 56 # Integer | 取引先ID
company_id = 56 # Integer | 事業所ID

begin
  #取引先の削除
  api_instance.destroy_partner(id, company_id)
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling PartnersApi->destroy_partner: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| 取引先ID | 
 **company_id** | **Integer**| 事業所ID | 

### Return type

nil (empty response body)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_partner

> PartnerResponse get_partner(id, company_id)

取引先の取得

 <h2 id=\"\">概要</h2>  <p>指定した事業所の取引先を取得する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::PartnersApi.new
id = 56 # Integer | 取引先ID
company_id = 56 # Integer | 事業所ID

begin
  #取引先の取得
  result = api_instance.get_partner(id, company_id)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling PartnersApi->get_partner: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| 取引先ID | 
 **company_id** | **Integer**| 事業所ID | 

### Return type

[**PartnerResponse**](PartnerResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_partners

> InlineResponse200 get_partners(company_id, opts)

取引先一覧の取得

 <h2 id=\"\">概要</h2>  <p>指定した事業所の取引先一覧を取得する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::PartnersApi.new
company_id = 56 # Integer | 事業所ID
opts = {
  offset: 56, # Integer | 取得レコードのオフセット (デフォルト: 0)
  limit: 56, # Integer | 取得レコードの件数 (デフォルト: 50, 最小: 1, 最大: 3000)
  keyword: 'keyword_example' # String | 検索キーワード：取引先名・正式名称・カナ名称に対するあいまい検索で一致、またはショートカットキー1・2のいずれかに完全一致
}

begin
  #取引先一覧の取得
  result = api_instance.get_partners(company_id, opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling PartnersApi->get_partners: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **company_id** | **Integer**| 事業所ID | 
 **offset** | **Integer**| 取得レコードのオフセット (デフォルト: 0) | [optional] 
 **limit** | **Integer**| 取得レコードの件数 (デフォルト: 50, 最小: 1, 最大: 3000) | [optional] 
 **keyword** | **String**| 検索キーワード：取引先名・正式名称・カナ名称に対するあいまい検索で一致、またはショートカットキー1・2のいずれかに完全一致 | [optional] 

### Return type

[**InlineResponse200**](InlineResponse200.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_partner

> PartnerResponse update_partner(id, partner_update_params)

取引先の更新

 <h2 id=\"\">概要</h2>  <p>指定した取引先の情報を更新する</p> <ul> <li>codeを指定、更新することはできません。</li></ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::PartnersApi.new
id = 56 # Integer | 取引先ID
partner_update_params = UnofficialFreeeSdk::PartnerUpdateParams.new # PartnerUpdateParams | 取引先の更新

begin
  #取引先の更新
  result = api_instance.update_partner(id, partner_update_params)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling PartnersApi->update_partner: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| 取引先ID | 
 **partner_update_params** | [**PartnerUpdateParams**](PartnerUpdateParams.md)| 取引先の更新 | 

### Return type

[**PartnerResponse**](PartnerResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json


## update_partner_by_code

> PartnerResponse update_partner_by_code(code, partner_update_params)

取引先の更新

 <h2 id=\"\">概要</h2>  <p>取引先コードをキーに、指定した取引先の情報を更新する</p> <ul> <li>このAPIを利用するには、事業所の設定から取引先コードの利用を有効にする必要があります。</li> <li>コードを日本語に設定している場合は、URLエンコードしてURLに含めるようにしてください。</li></ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::PartnersApi.new
code = 'code_example' # String | 取引先コード
partner_update_params = UnofficialFreeeSdk::PartnerUpdateParams.new # PartnerUpdateParams | 取引先の更新

begin
  #取引先の更新
  result = api_instance.update_partner_by_code(code, partner_update_params)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling PartnersApi->update_partner_by_code: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **code** | **String**| 取引先コード | 
 **partner_update_params** | [**PartnerUpdateParams**](PartnerUpdateParams.md)| 取引先の更新 | 

### Return type

[**PartnerResponse**](PartnerResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json

