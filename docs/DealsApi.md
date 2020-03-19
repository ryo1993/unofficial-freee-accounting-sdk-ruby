# UnofficialFreeeSdk::DealsApi

All URIs are relative to *https://api.freee.co.jp*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_deal**](DealsApi.md#create_deal) | **POST** /api/1/deals | 取引（収入／支出）の作成
[**destroy_deal**](DealsApi.md#destroy_deal) | **DELETE** /api/1/deals/{id} | 取引（収入／支出）の削除
[**get_deal**](DealsApi.md#get_deal) | **GET** /api/1/deals/{id} | 取引（収入／支出）の取得
[**get_deals**](DealsApi.md#get_deals) | **GET** /api/1/deals | 取引（収入／支出）一覧の取得
[**update_deal**](DealsApi.md#update_deal) | **PUT** /api/1/deals/{id} | 取引（収入／支出）の更新



## create_deal

> DealCreateResponse create_deal(opts)

取引（収入／支出）の作成

<h2 id=\"\">概要</h2> <p>指定した事業所の取引（収入／支出）を作成する</p> <h2 id=\"_2\">定義</h2> <ul> <li> <p>issue_date : 発生日</p> </li> <li> <p>due_date : 支払期日</p> </li> <li> <p>amount : 金額</p> </li> <li> <p>due_amount : 支払残額</p> </li> <li> <p>type</p> <ul> <li>income : 収入</li> <li>expense : 支出</li> </ul> </li> <li> <p>ref_number : 管理番号</p> </li> <li> <p>details : 取引の明細行</p> </li> <li> <p>payments : 取引の支払行</p> </li> <li> <p>receipt_ids : 証憑ファイルID</p> </li> <li> <p>from_walletable_type</p> <ul> <li>bank_account : 銀行口座</li> <li>credit_card : クレジットカード</li> <li>wallet : 現金</li> <li>private_account_item : プライベート資金（法人の場合は役員借入金もしくは役員借入金、個人の場合は事業主貸もしくは事業主借）</li> </ul> </li> </ul> <h2 id=\"_3\">注意点</h2> <ul> <li> <p>tax_idは廃止予定です。tax_codeをご利用ください。</p> </li> <li> <p>tax_code, tax_idはどちらかの指定が必須です。両方指定した場合はtax_codeが優先されます。</p> </li> <p><li>本APIでは+更新行(renews)の操作ができません。+更新行の作成APIをご利用ください。</p></li> <p><li>セグメントタグ情報は法人向けのプロフェッショナルプラン以上で利用可能です。利用可能なセグメントの数は、法人向けのプロフェッショナルプランの場合は1つ、エンタープライズプランの場合は3つです。</p></li> <li> <p>partner_codeを利用するには、事業所の設定から取引先コードの利用を有効にする必要があります。またpartner_codeとpartner_idは同時に指定することはできません。</p></li> </ul> 

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::DealsApi.new
opts = {
  deal_create_params: UnofficialFreeeSdk::DealCreateParams.new # DealCreateParams | 取引（収入／支出）の作成
}

begin
  #取引（収入／支出）の作成
  result = api_instance.create_deal(opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling DealsApi->create_deal: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deal_create_params** | [**DealCreateParams**](DealCreateParams.md)| 取引（収入／支出）の作成 | [optional] 

### Return type

[**DealCreateResponse**](DealCreateResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json


## destroy_deal

> destroy_deal(id, company_id)

取引（収入／支出）の削除

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::DealsApi.new
id = 56 # Integer | 取引ID
company_id = 56 # Integer | 事業所ID

begin
  #取引（収入／支出）の削除
  api_instance.destroy_deal(id, company_id)
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling DealsApi->destroy_deal: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| 取引ID | 
 **company_id** | **Integer**| 事業所ID | 

### Return type

nil (empty response body)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_deal

> DealResponse get_deal(company_id, id, opts)

取引（収入／支出）の取得

<h2 id=\"\">概要</h2> <p>指定した事業所の取引（収入／支出）を取得する</p> <h2 id=\"_2\">定義</h2> <ul> <li> <p>issue_date : 発生日</p> </li> <li> <p>due_date : 支払期日</p> </li> <li> <p>amount : 金額</p> </li> <li> <p>due_amount : 支払残額</p> </li> <li> <p>type</p> <ul> <li>income : 収入</li> <li>expense : 支出</li> </ul> </li> <li> <p>details : 取引の明細行</p> </li> <li> <p>accruals : 取引の債権債務行</p> </li> <li> <p>renews : 取引の+更新行</p> </li> <li> <p>payments : 取引の支払行</p> </li> <li> <p>from_walletable_type</p> <ul> <li>bank_account : 銀行口座</li> <li>credit_card : クレジットカード</li> <li>wallet : 現金</li> <li>private_account_item : プライベート資金（法人の場合は役員借入金もしくは役員借入金、個人の場合は事業主貸もしくは事業主借）</li> </ul> </li> <li> <p>registered_from</p> <ul> <li>all : すべての取引</li> <li>me : 自身が登録した取引</li> </ul> </li> </ul> <h2 id=\"_3\">注意点</h2> <ul> <li>tax_idは廃止予定です。tax_codeをご利用ください。</li> <li>セグメントタグ情報は法人向けのプロフェッショナルプラン以上で利用可能です。利用可能なセグメントの数は、法人向けのプロフェッショナルプランの場合は1つ、エンタープライズプランの場合は3つです。</li> </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::DealsApi.new
company_id = 56 # Integer | 事業所ID
id = 56 # Integer | 
opts = {
  accruals: 'accruals_example' # String | 取引の債権債務行の表示（without: 表示しない(デフォルト), with: 表示する）
}

begin
  #取引（収入／支出）の取得
  result = api_instance.get_deal(company_id, id, opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling DealsApi->get_deal: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **company_id** | **Integer**| 事業所ID | 
 **id** | **Integer**|  | 
 **accruals** | **String**| 取引の債権債務行の表示（without: 表示しない(デフォルト), with: 表示する） | [optional] 

### Return type

[**DealResponse**](DealResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_deals

> InlineResponse2005 get_deals(company_id, opts)

取引（収入／支出）一覧の取得

<h2 id=\"\">概要</h2> <p>指定した事業所の取引一覧（収入／支出）を取得する</p> <h2 id=\"_2\">定義</h2> <ul> <li> <p>issue_date : 発生日</p> </li> <li> <p>due_date : 支払期日</p> </li> <li> <p>amount : 金額</p> </li> <li> <p>due_amount : 支払残額</p> </li> <li> <p>type</p> <ul> <li>income : 収入</li> <li>expense : 支出</li> </ul> </li> <li> <p>details : 取引の明細行</p> </li> <li> <p>accruals : 取引の債権債務行</p> </li> <li> <p>renews : 取引の+更新行</p> </li> <li> <p>payments : 取引の支払行</p> </li> <li> <p>from_walletable_type</p> <ul> <li>bank_account : 銀行口座</li> <li>credit_card : クレジットカード</li> <li>wallet : 現金</li> <li>private_account_item : プライベート資金（法人の場合は役員借入金もしくは役員借入金、個人の場合は事業主貸もしくは事業主借）</li> </ul> </li> <li> <p>registered_from</p> <ul> <li>all : すべての取引</li> <li>me : 自身が登録した取引</li> </ul> </li> </ul> <h2 id=\"_3\">注意点</h2> <ul> <li>tax_idは廃止予定です。tax_codeをご利用ください。</li> <li>セグメントタグ情報は法人向けのプロフェッショナルプラン以上で利用可能です。利用可能なセグメントの数は、法人向けのプロフェッショナルプランの場合は1つ、エンタープライズプランの場合は3つです。</li> <li>partner_codeを利用するには、事業所の設定から取引先コードの利用を有効にする必要があります。またpartner_codeとpartner_idは同時に指定することはできません。</li> </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::DealsApi.new
company_id = 56 # Integer | 事業所ID
opts = {
  partner_id: 56, # Integer | 取引先IDで絞込
  account_item_id: 56, # Integer | 勘定科目IDで絞込
  partner_code: 'partner_code_example', # String | 取引先コードで絞込
  status: 'status_example', # String | 決済状況で絞込 (未決済: unsettled, 完了: settled)
  type: 'type_example', # String | 収支区分 (収入: income, 支出: expense)
  start_issue_date: 'start_issue_date_example', # String | 発生日で絞込：開始日(yyyy-mm-dd)
  end_issue_date: 'end_issue_date_example', # String | 発生日で絞込：終了日(yyyy-mm-dd)
  start_due_date: 'start_due_date_example', # String | 支払期日で絞込：開始日(yyyy-mm-dd)
  end_due_date: 'end_due_date_example', # String | 支払期日で絞込：終了日(yyyy-mm-dd)
  start_renew_date: 'start_renew_date_example', # String | +更新日で絞込：開始日(yyyy-mm-dd)
  end_renew_date: 'end_renew_date_example', # String | +更新日で絞込：終了日(yyyy-mm-dd)
  offset: 56, # Integer | 取得レコードのオフセット (デフォルト: 0)
  limit: 56, # Integer | 取得レコードの件数 (デフォルト: 20, 最大: 100) 
  registered_from: 'registered_from_example', # String | 取引登録元アプリで絞込（me: 本APIを叩くアプリ自身から登録した取引のみ）
  accruals: 'accruals_example' # String | 取引の債権債務行の表示（without: 表示しない(デフォルト), with: 表示する）
}

begin
  #取引（収入／支出）一覧の取得
  result = api_instance.get_deals(company_id, opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling DealsApi->get_deals: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **company_id** | **Integer**| 事業所ID | 
 **partner_id** | **Integer**| 取引先IDで絞込 | [optional] 
 **account_item_id** | **Integer**| 勘定科目IDで絞込 | [optional] 
 **partner_code** | **String**| 取引先コードで絞込 | [optional] 
 **status** | **String**| 決済状況で絞込 (未決済: unsettled, 完了: settled) | [optional] 
 **type** | **String**| 収支区分 (収入: income, 支出: expense) | [optional] 
 **start_issue_date** | **String**| 発生日で絞込：開始日(yyyy-mm-dd) | [optional] 
 **end_issue_date** | **String**| 発生日で絞込：終了日(yyyy-mm-dd) | [optional] 
 **start_due_date** | **String**| 支払期日で絞込：開始日(yyyy-mm-dd) | [optional] 
 **end_due_date** | **String**| 支払期日で絞込：終了日(yyyy-mm-dd) | [optional] 
 **start_renew_date** | **String**| +更新日で絞込：開始日(yyyy-mm-dd) | [optional] 
 **end_renew_date** | **String**| +更新日で絞込：終了日(yyyy-mm-dd) | [optional] 
 **offset** | **Integer**| 取得レコードのオフセット (デフォルト: 0) | [optional] 
 **limit** | **Integer**| 取得レコードの件数 (デフォルト: 20, 最大: 100)  | [optional] 
 **registered_from** | **String**| 取引登録元アプリで絞込（me: 本APIを叩くアプリ自身から登録した取引のみ） | [optional] 
 **accruals** | **String**| 取引の債権債務行の表示（without: 表示しない(デフォルト), with: 表示する） | [optional] 

### Return type

[**InlineResponse2005**](InlineResponse2005.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_deal

> DealResponse update_deal(id, opts)

取引（収入／支出）の更新

<h2 id=\"\">概要</h2> <p>指定した事業所の取引（収入／支出）を更新する</p> <h2 id=\"_2\">定義</h2> <ul> <li> <p>issue_date : 発生日</p> </li> <li> <p>due_date : 支払期日</p> </li> <li> <p>amount : 金額</p> </li> <li> <p>due_amount : 支払残額</p> </li> <li> <p>type</p> <ul> <li>income : 収入</li> <li>expense : 支出</li> </ul> </li> <li> <p>details : 取引の明細行</p> </li> <li> <p>renews : 取引の+更新行</p> </li> <li> <p>payments : 取引の支払行</p> </li> <li> <p>from_walletable_type</p> <ul> <li>bank_account : 銀行口座</li> <li>credit_card : クレジットカード</li> <li>wallet : 現金</li> <li>private_account_item : プライベート資金（法人の場合は役員借入金もしくは役員借入金、個人の場合は事業主貸もしくは事業主借）</li> </ul> </li> <li> <p>receipt_ids : 証憑ファイルID</p> </li> </ul> <h2 id=\"_3\">注意点</h2> <ul> <li>本APIでは支払行(payments)の操作ができません。支払行の作成・更新・削除APIをご利用ください。</li> <li>本APIでは+更新行(renews)の操作ができません。+更新行の作成・更新・削除APIをご利用ください。</li> <li>本APIでは収入／支出の切替えができません。既存の取引を削除後、再度作成してください。</li> <li>本APIで取引を更新すると、消費税の計算方法は必ず内税方式が選択されます。</li> <li>セグメントタグ情報は法人向けのプロフェッショナルプラン以上で利用可能です。利用可能なセグメントの数は、法人向けのプロフェッショナルプランの場合は1つ、エンタープライズプランの場合は3つです。</li> <li>partner_codeを利用するには、事業所の設定から取引先コードの利用を有効にする必要があります。またpartner_codeとpartner_idは同時に指定することはできません。</ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::DealsApi.new
id = 56 # Integer | 取引ID
opts = {
  deal_update_params: UnofficialFreeeSdk::DealUpdateParams.new # DealUpdateParams | 取引（収入／支出）の更新
}

begin
  #取引（収入／支出）の更新
  result = api_instance.update_deal(id, opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling DealsApi->update_deal: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| 取引ID | 
 **deal_update_params** | [**DealUpdateParams**](DealUpdateParams.md)| 取引（収入／支出）の更新 | [optional] 

### Return type

[**DealResponse**](DealResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json

