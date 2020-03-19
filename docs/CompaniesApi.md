# UnofficialFreeeSdk::CompaniesApi

All URIs are relative to *https://api.freee.co.jp*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_companies**](CompaniesApi.md#get_companies) | **GET** /api/1/companies | 事業所一覧の取得
[**get_company**](CompaniesApi.md#get_company) | **GET** /api/1/companies/{id} | 事業所の詳細情報の取得
[**update_company**](CompaniesApi.md#update_company) | **PUT** /api/1/companies/{id} | 事業所情報の更新



## get_companies

> CompanyIndexResponse get_companies

事業所一覧の取得

 <h2 id=\"\">概要</h2>  <p>ユーザが所属する事業所の一覧を取得する</p>  <h2 id=\"_2\">定義</h2>  <ul> <li>role <ul> <li>admin : 管理者</li>  <li>simple_accounting : 一般</li>  <li>self_only : 取引登録のみ</li>  <li>read_only : 閲覧のみ</li> </ul> </li> </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::CompaniesApi.new

begin
  #事業所一覧の取得
  result = api_instance.get_companies
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling CompaniesApi->get_companies: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**CompanyIndexResponse**](CompanyIndexResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_company

> CompanyResponse get_company(id, opts)

事業所の詳細情報の取得

 <h2 id=\"\">概要</h2>  <p>ユーザが所属する事業所の詳細を取得する</p>  <h2 id=\"_2\">定義</h2>  <ul> <li>role <ul> <li>admin : 管理者</li>  <li>simple_accounting : 一般</li>  <li>self_only : 取引登録のみ</li>  <li>read_only : 閲覧のみ</li> </ul> </li> </ul>  <h2 id=\"_3\">

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::CompaniesApi.new
id = 56 # Integer | 事業所ID
opts = {
  details: true, # Boolean | 取得情報に勘定科目・税区分コード・税区分・品目・取引先・部門・メモタグ・口座の一覧を含める
  account_items: true, # Boolean | 取得情報に勘定科目一覧を含める
  taxes: true, # Boolean | 取得情報に税区分コード・税区分一覧を含める
  items: true, # Boolean | 取得情報に品目一覧を含める
  partners: true, # Boolean | 取得情報に取引先一覧を含める
  sections: true, # Boolean | 取得情報に部門一覧を含める
  tags: true, # Boolean | 取得情報にメモタグ一覧を含める
  walletables: true # Boolean | 取得情報に口座一覧を含める
}

begin
  #事業所の詳細情報の取得
  result = api_instance.get_company(id, opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling CompaniesApi->get_company: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| 事業所ID | 
 **details** | **Boolean**| 取得情報に勘定科目・税区分コード・税区分・品目・取引先・部門・メモタグ・口座の一覧を含める | [optional] 
 **account_items** | **Boolean**| 取得情報に勘定科目一覧を含める | [optional] 
 **taxes** | **Boolean**| 取得情報に税区分コード・税区分一覧を含める | [optional] 
 **items** | **Boolean**| 取得情報に品目一覧を含める | [optional] 
 **partners** | **Boolean**| 取得情報に取引先一覧を含める | [optional] 
 **sections** | **Boolean**| 取得情報に部門一覧を含める | [optional] 
 **tags** | **Boolean**| 取得情報にメモタグ一覧を含める | [optional] 
 **walletables** | **Boolean**| 取得情報に口座一覧を含める | [optional] 

### Return type

[**CompanyResponse**](CompanyResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_company

> CompanyUpdateResponse update_company(id, opts)

事業所情報の更新

 <h2 id=\"\">概要</h2>  <p>ユーザが所属する事業所の情報を更新する</p>  <p>※同時に複数のリクエストを受け付けない</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::CompaniesApi.new
id = 56 # Integer | 事業所ID
opts = {
  company_params: UnofficialFreeeSdk::CompanyParams.new # CompanyParams | 
}

begin
  #事業所情報の更新
  result = api_instance.update_company(id, opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling CompaniesApi->update_company: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| 事業所ID | 
 **company_params** | [**CompanyParams**](CompanyParams.md)|  | [optional] 

### Return type

[**CompanyUpdateResponse**](CompanyUpdateResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json

