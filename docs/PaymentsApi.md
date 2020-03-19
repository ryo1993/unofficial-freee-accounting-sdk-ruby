# UnofficialFreeeSdk::PaymentsApi

All URIs are relative to *https://api.freee.co.jp*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_deal_payment**](PaymentsApi.md#create_deal_payment) | **POST** /api/1/deals/{id}/payments | 取引（収入／支出）の支払行作成
[**destroy_deal_payment**](PaymentsApi.md#destroy_deal_payment) | **DELETE** /api/1/deals/{id}/payments/{payment_id} | 取引（収入／支出）の支払行削除
[**update_deal_payment**](PaymentsApi.md#update_deal_payment) | **PUT** /api/1/deals/{id}/payments/{payment_id} | 取引（収入／支出）の支払行更新



## create_deal_payment

> DealResponse create_deal_payment(id, payment_params)

取引（収入／支出）の支払行作成

<h2 id=\"\">概要</h2> <p>指定した事業所の取引（収入／支出）の支払行を作成する</p> <h2 id=\"_2\">定義</h2> <ul> <li> <p>issue_date : 発生日</p> </li> <li> <p>due_date : 支払期日</p> </li> <li> <p>amount : 金額</p> </li> <li> <p>due_amount : 支払残額</p> </li> <li> <p>type</p> <ul> <li>income : 収入</li> <li>expense : 支出</li> </ul> </li> <li> <p>details : 取引の明細行</p> </li> <li> <p>renews : 取引の+更新行</p> </li> <li> <p>payments : 取引の支払行</p> </li> <li> <p>from_walletable_type</p> <ul> <li>bank_account : 銀行口座</li> <li>credit_card : クレジットカード</li> <li>wallet : 現金</li> <li>private_account_item : プライベート資金（法人の場合は役員借入金もしくは役員借入金、個人の場合は事業主貸もしくは事業主借）</li> </ul> </li> </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::PaymentsApi.new
id = 56 # Integer | 取引ID
payment_params = UnofficialFreeeSdk::PaymentParams.new # PaymentParams | 取引（収入／支出）の支払行作成

begin
  #取引（収入／支出）の支払行作成
  result = api_instance.create_deal_payment(id, payment_params)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling PaymentsApi->create_deal_payment: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| 取引ID | 
 **payment_params** | [**PaymentParams**](PaymentParams.md)| 取引（収入／支出）の支払行作成 | 

### Return type

[**DealResponse**](DealResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json


## destroy_deal_payment

> destroy_deal_payment(id, payment_id, company_id)

取引（収入／支出）の支払行削除

<h2 id=\"\">概要</h2> <p>指定した事業所の取引（収入／支出）の支払行を削除する</p> <h2 id=\"_2\">定義</h2> <ul> <li> <p>issue_date : 発生日</p> </li> <li> <p>due_date : 支払期日</p> </li> <li> <p>amount : 金額</p> </li> <li> <p>due_amount : 支払残額</p> </li> <li> <p>type</p> <ul> <li>income : 収入</li> <li>expense : 支出</li> </ul> </li> <li> <p>details : 取引の明細行</p> </li> </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::PaymentsApi.new
id = 56 # Integer | 取引ID
payment_id = 56 # Integer | 決済ID
company_id = 56 # Integer | 事業所ID

begin
  #取引（収入／支出）の支払行削除
  api_instance.destroy_deal_payment(id, payment_id, company_id)
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling PaymentsApi->destroy_deal_payment: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| 取引ID | 
 **payment_id** | **Integer**| 決済ID | 
 **company_id** | **Integer**| 事業所ID | 

### Return type

nil (empty response body)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_deal_payment

> DealResponse update_deal_payment(id, payment_id, payment_params)

取引（収入／支出）の支払行更新

<h2 id=\"\">概要</h2> <p>指定した事業所の取引（収入／支出）の支払行を更新する</p> <h2 id=\"_2\">定義</h2> <ul> <li> <p>issue_date : 発生日</p> </li> <li> <p>due_date : 支払期日</p> </li> <li> <p>amount : 金額</p> </li> <li> <p>due_amount : 支払残額</p> </li> <li> <p>type</p> <ul> <li>income : 収入</li> <li>expense : 支出</li> </ul> </li> <li> <p>details : 取引の明細行</p> </li> <li> <p>renews : 取引の+更新行</p> </li> <li> <p>payments : 取引の支払行</p> </li> <li> <p>from_walletable_type</p> <ul> <li>bank_account : 銀行口座</li> <li>credit_card : クレジットカード</li> <li>wallet : 現金</li> <li>private_account_item : プライベート資金（法人の場合は役員借入金もしくは役員借入金、個人の場合は事業主貸もしくは事業主借）</li> </ul> </li> </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::PaymentsApi.new
id = 56 # Integer | 取引ID
payment_id = 56 # Integer | 決済ID
payment_params = UnofficialFreeeSdk::PaymentParams.new # PaymentParams | 取引（収入／支出）の支払行更新

begin
  #取引（収入／支出）の支払行更新
  result = api_instance.update_deal_payment(id, payment_id, payment_params)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling PaymentsApi->update_deal_payment: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| 取引ID | 
 **payment_id** | **Integer**| 決済ID | 
 **payment_params** | [**PaymentParams**](PaymentParams.md)| 取引（収入／支出）の支払行更新 | 

### Return type

[**DealResponse**](DealResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json

