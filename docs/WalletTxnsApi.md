# UnofficialFreeeSdk::WalletTxnsApi

All URIs are relative to *https://api.freee.co.jp*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_wallet_txn**](WalletTxnsApi.md#create_wallet_txn) | **POST** /api/1/wallet_txns | 明細の作成
[**destroy_wallet_txn**](WalletTxnsApi.md#destroy_wallet_txn) | **DELETE** /api/1/wallet_txns/{id} | 明細の削除
[**get_wallet_txn**](WalletTxnsApi.md#get_wallet_txn) | **GET** /api/1/wallet_txns/{id} | 明細の取得
[**get_wallet_txns**](WalletTxnsApi.md#get_wallet_txns) | **GET** /api/1/wallet_txns | 明細一覧の取得



## create_wallet_txn

> WalletTxnResponse create_wallet_txn(opts)

明細の作成

 <h2 id=\"\">概要</h2>  <p>指定した事業所の明細を作成する</p>  <h2 id=\"_2\">定義</h2>  <ul> <li> <p>amount : 明細金額</p> </li>  <li> <p>due_amount : 取引登録待ち金額</p> </li>  <li> <p>balance : 残高</p> </li>  <li> <p>entry_side</p>  <ul> <li>income : 入金</li>  <li>expense : 出金</li> </ul> </li>  <li> <p>walletable_type</p>  <ul> <li>bank_account : 銀行口座</li>  <li>credit_card : クレジットカード</li>  <li>wallet : その他の決済口座</li> </ul> </li> </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::WalletTxnsApi.new
opts = {
  wallet_txn_params: UnofficialFreeeSdk::WalletTxnParams.new # WalletTxnParams | 明細の作成
}

begin
  #明細の作成
  result = api_instance.create_wallet_txn(opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling WalletTxnsApi->create_wallet_txn: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **wallet_txn_params** | [**WalletTxnParams**](WalletTxnParams.md)| 明細の作成 | [optional] 

### Return type

[**WalletTxnResponse**](WalletTxnResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json


## destroy_wallet_txn

> destroy_wallet_txn(id, company_id)

明細の削除

 <h2 id=\"\">概要</h2>  <p>指定した事業所の明細を削除する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::WalletTxnsApi.new
id = 56 # Integer | 明細ID
company_id = 56 # Integer | 事業所ID

begin
  #明細の削除
  api_instance.destroy_wallet_txn(id, company_id)
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling WalletTxnsApi->destroy_wallet_txn: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| 明細ID | 
 **company_id** | **Integer**| 事業所ID | 

### Return type

nil (empty response body)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_wallet_txn

> WalletTxnResponse get_wallet_txn(id, company_id)

明細の取得

 <h2 id=\"\">概要</h2>  <p>指定した事業所の明細を取得する</p>  <h2 id=\"_2\">定義</h2>  <ul> <li> <p>amount : 明細金額</p> </li>  <li> <p>due_amount : 取引登録待ち金額</p> </li>  <li> <p>balance : 残高</p> </li>  <li> <p>entry_side</p>  <ul> <li>income : 入金</li>  <li>expense : 出金</li> </ul> </li>  <li> <p>walletable_type</p>  <ul> <li>bank_account : 銀行口座</li>  <li>credit_card : クレジットカード</li>  <li>wallet : その他の決済口座</li> </ul> </li> </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::WalletTxnsApi.new
id = 56 # Integer | 明細ID
company_id = 56 # Integer | 事業所ID

begin
  #明細の取得
  result = api_instance.get_wallet_txn(id, company_id)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling WalletTxnsApi->get_wallet_txn: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| 明細ID | 
 **company_id** | **Integer**| 事業所ID | 

### Return type

[**WalletTxnResponse**](WalletTxnResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_wallet_txns

> InlineResponse20015 get_wallet_txns(company_id, opts)

明細一覧の取得

 <h2 id=\"\">概要</h2>  <p>指定した事業所の明細一覧を取得する</p>  <h2 id=\"_2\">定義</h2>  <ul> <li> <p>amount : 明細金額</p> </li>  <li> <p>due_amount : 取引登録待ち金額</p> </li>  <li> <p>balance : 残高</p> </li>  <li> <p>entry_side</p>  <ul> <li>income : 入金</li>  <li>expense : 出金</li> </ul> </li>  <li> <p>walletable_type</p>  <ul> <li>bank_account : 銀行口座</li>  <li>credit_card : クレジットカード</li>  <li>wallet : その他の決済口座</li> </ul> </li> </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::WalletTxnsApi.new
company_id = 56 # Integer | 事業所ID
opts = {
  walletable_type: 'walletable_type_example', # String | 口座区分 (銀行口座: bank_account, クレジットカード: credit_card, 現金: wallet)
  walletable_id: 56, # Integer | 口座ID
  start_date: 'start_date_example', # String | 取引日で絞込：開始日 (yyyy-mm-dd)
  end_date: 'end_date_example', # String | 取引日で絞込：終了日 (yyyy-mm-dd)
  entry_side: 'entry_side_example', # String | 入金／出金 (入金: income, 出金: expense)
  offset: 56, # Integer | 取得レコードのオフセット (デフォルト: 0)
  limit: 56 # Integer | 取得レコードの件数 (デフォルト: 20, 最小: 1, 最大: 100) 
}

begin
  #明細一覧の取得
  result = api_instance.get_wallet_txns(company_id, opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling WalletTxnsApi->get_wallet_txns: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **company_id** | **Integer**| 事業所ID | 
 **walletable_type** | **String**| 口座区分 (銀行口座: bank_account, クレジットカード: credit_card, 現金: wallet) | [optional] 
 **walletable_id** | **Integer**| 口座ID | [optional] 
 **start_date** | **String**| 取引日で絞込：開始日 (yyyy-mm-dd) | [optional] 
 **end_date** | **String**| 取引日で絞込：終了日 (yyyy-mm-dd) | [optional] 
 **entry_side** | **String**| 入金／出金 (入金: income, 出金: expense) | [optional] 
 **offset** | **Integer**| 取得レコードのオフセット (デフォルト: 0) | [optional] 
 **limit** | **Integer**| 取得レコードの件数 (デフォルト: 20, 最小: 1, 最大: 100)  | [optional] 

### Return type

[**InlineResponse20015**](InlineResponse20015.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

