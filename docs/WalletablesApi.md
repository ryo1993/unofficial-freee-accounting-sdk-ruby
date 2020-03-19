# UnofficialFreeeSdk::WalletablesApi

All URIs are relative to *https://api.freee.co.jp*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_walletable**](WalletablesApi.md#create_walletable) | **POST** /api/1/walletables | 口座の作成
[**destroy_walletable**](WalletablesApi.md#destroy_walletable) | **DELETE** /api/1/walletables/{type}/{id} | 口座の削除
[**get_walletable**](WalletablesApi.md#get_walletable) | **GET** /api/1/walletables/{type}/{id} | 口座情報の取得
[**get_walletables**](WalletablesApi.md#get_walletables) | **GET** /api/1/walletables | 口座一覧の取得
[**update_walletable**](WalletablesApi.md#update_walletable) | **PUT** /api/1/walletables/{type}/{id} | 口座の更新



## create_walletable

> WalletableCreateResponse create_walletable(opts)

口座の作成

 <h2 id=\"\">概要</h2>  <p>指定した事業所に口座を作成する</p>  <h2 id=\"\">注意点</h2> <ul><li>同期に対応した口座はこのAPIでは作成できません</li></ul>  <h2 id=\"_2\">定義</h2>  <ul> <li> <p>type</p>  <ul> <li>bank_account : 銀行口座</li>  <li>credit_card : クレジットカード</li>  <li>wallet : その他の決済口座</li> </ul> </li>  <li> <p>name : 口座名</p> </li>  <li> <p>bank_id : サービスID</p> </li>  <li> <p>group_name : 決算書表示名（小カテゴリー）　例：売掛金, 受取手形, 未収入金（法人のみ）, 買掛金, 支払手形, 未払金, 預り金, 前受金</p> </li> </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::WalletablesApi.new
opts = {
  walletable_create_params: UnofficialFreeeSdk::WalletableCreateParams.new # WalletableCreateParams | 口座の作成
}

begin
  #口座の作成
  result = api_instance.create_walletable(opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling WalletablesApi->create_walletable: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **walletable_create_params** | [**WalletableCreateParams**](WalletableCreateParams.md)| 口座の作成 | [optional] 

### Return type

[**WalletableCreateResponse**](WalletableCreateResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json


## destroy_walletable

> destroy_walletable(id, type, company_id)

口座の削除

 <h2 id=\"\">概要</h2>  <p>指定した事業所の口座を削除する</p>  <h2 id=\"\">注意点</h2> <ul> <li>削除を実行するには、当該口座に関連する仕訳データを事前に削除する必要があります。</li> <li>当該口座に仕訳が残っていないか確認するには、レポートの「仕訳帳」等を参照し、必要に応じて、「取引」や「口座振替」も削除します。</li>  </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::WalletablesApi.new
id = 56 # Integer | 口座ID
type = 'type_example' # String | 口座種別（bank_account : 銀行口座, credit_card : クレジットカード, wallet : その他の決済口座）
company_id = 56 # Integer | 事業所ID

begin
  #口座の削除
  api_instance.destroy_walletable(id, type, company_id)
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling WalletablesApi->destroy_walletable: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| 口座ID | 
 **type** | **String**| 口座種別（bank_account : 銀行口座, credit_card : クレジットカード, wallet : その他の決済口座） | 
 **company_id** | **Integer**| 事業所ID | 

### Return type

nil (empty response body)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_walletable

> WalletableResponse get_walletable(id, type, company_id)

口座情報の取得

 <h2 id=\"\">概要</h2>  <p>指定した事業所の口座情報を取得する</p>  <h2 id=\"_2\">定義</h2>  <ul> <li>type <ul> <li>bank_account : 銀行口座</li>  <li>credit_card : クレジットカード</li>  <li>wallet : その他の決済口座</li> </ul> </li>  <li>walletable_balance : 登録残高</li>  <li>last_balance : 同期残高</li> </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::WalletablesApi.new
id = 56 # Integer | 口座ID
type = 'type_example' # String | 口座種別（bank_account : 銀行口座, credit_card : クレジットカード, wallet : その他の決済口座）
company_id = 56 # Integer | 事業所ID

begin
  #口座情報の取得
  result = api_instance.get_walletable(id, type, company_id)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling WalletablesApi->get_walletable: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| 口座ID | 
 **type** | **String**| 口座種別（bank_account : 銀行口座, credit_card : クレジットカード, wallet : その他の決済口座） | 
 **company_id** | **Integer**| 事業所ID | 

### Return type

[**WalletableResponse**](WalletableResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_walletables

> InlineResponse20012 get_walletables(company_id, opts)

口座一覧の取得

 <h2 id=\"\">概要</h2>  <p>指定した事業所の口座一覧を取得する</p>  <h2 id=\"_2\">定義</h2>  <ul> <li>type <ul> <li>bank_account : 銀行口座</li>  <li>credit_card : クレジットカード</li>  <li>wallet : その他の決済口座</li> </ul> </li>  <li>walletable_balance : 登録残高</li>  <li>last_balance : 同期残高</li> </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::WalletablesApi.new
company_id = 56 # Integer | 事業所ID
opts = {
  with_balance: true, # Boolean | 残高情報を含める
  type: 'type_example' # String | 口座種別（bank_account : 銀行口座, credit_card : クレジットカード, wallet : その他の決済口座）
}

begin
  #口座一覧の取得
  result = api_instance.get_walletables(company_id, opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling WalletablesApi->get_walletables: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **company_id** | **Integer**| 事業所ID | 
 **with_balance** | **Boolean**| 残高情報を含める | [optional] 
 **type** | **String**| 口座種別（bank_account : 銀行口座, credit_card : クレジットカード, wallet : その他の決済口座） | [optional] 

### Return type

[**InlineResponse20012**](InlineResponse20012.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_walletable

> WalletableResponse update_walletable(id, type, company_id, opts)

口座の更新

 <h2 id=\"\">概要</h2>  <p>口座を更新する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::WalletablesApi.new
id = 56 # Integer | 
type = 'type_example' # String | 口座種別（bank_account : 銀行口座, credit_card : クレジットカード, wallet : その他の決済口座）
company_id = 56 # Integer | 事業所ID
opts = {
  walletable_update_params: UnofficialFreeeSdk::WalletableUpdateParams.new # WalletableUpdateParams | 口座の作成
}

begin
  #口座の更新
  result = api_instance.update_walletable(id, type, company_id, opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling WalletablesApi->update_walletable: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**|  | 
 **type** | **String**| 口座種別（bank_account : 銀行口座, credit_card : クレジットカード, wallet : その他の決済口座） | 
 **company_id** | **Integer**| 事業所ID | 
 **walletable_update_params** | [**WalletableUpdateParams**](WalletableUpdateParams.md)| 口座の作成 | [optional] 

### Return type

[**WalletableResponse**](WalletableResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json

