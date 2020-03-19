# UnofficialFreeeSdk::UsersApi

All URIs are relative to *https://api.freee.co.jp*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_users**](UsersApi.md#get_users) | **GET** /api/1/users | 事業所に所属するユーザー一覧の取得
[**get_users_capabilities**](UsersApi.md#get_users_capabilities) | **GET** /api/1/users/capabilities | ログインユーザの権限の取得
[**get_users_me**](UsersApi.md#get_users_me) | **GET** /api/1/users/me | ログインユーザ情報の取得
[**update_user**](UsersApi.md#update_user) | **PUT** /api/1/users/me | ユーザー情報の更新



## get_users

> InlineResponse2007 get_users(company_id, opts)

事業所に所属するユーザー一覧の取得

 <h2 id=\"\">概要</h2>  <p>事業所に所属するユーザーの一覧を取得する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::UsersApi.new
company_id = 56 # Integer | 事業所ID
opts = {
  limit: 56 # Integer | 取得レコードの件数 (デフォルト: 50, 最小: 1, 最大: 3000)
}

begin
  #事業所に所属するユーザー一覧の取得
  result = api_instance.get_users(company_id, opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling UsersApi->get_users: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **company_id** | **Integer**| 事業所ID | 
 **limit** | **Integer**| 取得レコードの件数 (デフォルト: 50, 最小: 1, 最大: 3000) | [optional] 

### Return type

[**InlineResponse2007**](InlineResponse2007.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_users_capabilities

> InlineResponse2008 get_users_capabilities(company_id)

ログインユーザの権限の取得

 <h2 id=\"\">概要</h2>  <p>ユーザの権限情報を取得する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::UsersApi.new
company_id = 56 # Integer | 事業所ID

begin
  #ログインユーザの権限の取得
  result = api_instance.get_users_capabilities(company_id)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling UsersApi->get_users_capabilities: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **company_id** | **Integer**| 事業所ID | 

### Return type

[**InlineResponse2008**](InlineResponse2008.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_users_me

> MeResponse get_users_me(opts)

ログインユーザ情報の取得

 <h2 id=\"\">概要</h2>  <p>ユーザの情報を取得する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::UsersApi.new
opts = {
  companies: true # Boolean | 取得情報にユーザが所属する事業所一覧を含める
}

begin
  #ログインユーザ情報の取得
  result = api_instance.get_users_me(opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling UsersApi->get_users_me: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **companies** | **Boolean**| 取得情報にユーザが所属する事業所一覧を含める | [optional] 

### Return type

[**MeResponse**](MeResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_user

> UserResponse update_user(opts)

ユーザー情報の更新

 <h2 id=\"\">概要</h2>  <p>ユーザー情報を更新する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::UsersApi.new
opts = {
  user_params: UnofficialFreeeSdk::UserParams.new # UserParams | ユーザー情報の更新
}

begin
  #ユーザー情報の更新
  result = api_instance.update_user(opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling UsersApi->update_user: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **user_params** | [**UserParams**](UserParams.md)| ユーザー情報の更新 | [optional] 

### Return type

[**UserResponse**](UserResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json

