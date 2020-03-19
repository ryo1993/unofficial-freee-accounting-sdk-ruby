# UnofficialFreeeSdk::ManualJournalsApi

All URIs are relative to *https://api.freee.co.jp*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_manual_journal**](ManualJournalsApi.md#create_manual_journal) | **POST** /api/1/manual_journals | 振替伝票の作成
[**destroy_manual_journal**](ManualJournalsApi.md#destroy_manual_journal) | **DELETE** /api/1/manual_journals/{id} | 振替伝票の削除
[**get_manual_journal**](ManualJournalsApi.md#get_manual_journal) | **GET** /api/1/manual_journals/{id} | 振替伝票の取得
[**get_manual_journals**](ManualJournalsApi.md#get_manual_journals) | **GET** /api/1/manual_journals | 振替伝票一覧の取得
[**update_manual_journal**](ManualJournalsApi.md#update_manual_journal) | **PUT** /api/1/manual_journals/{id} | 振替伝票の更新



## create_manual_journal

> ManualJournalResponse create_manual_journal(opts)

振替伝票の作成

 <h2 id=\"\">概要</h2>  <p>指定した事業所の振替伝票を作成する</p>  <h2 id=\"_2\">定義</h2>  <ul> <li> <p>issue_date : 発生日</p> </li>  <li> <p>adjustment : 決算整理仕訳フラグ（true: 決算整理仕訳, false: 日常仕訳）</p> </li>  <li> <p>txn_number : 仕訳番号</p> </li>  <li> <p>details : 振替伝票の貸借行</p> </li>  <li> <p>entry_side : 貸借区分</p>  <ul> <li>credit : 貸方</li>  <li>debit : 借方</li> </ul> </li>  <li> <p>amount : 金額</p> </li> </ul>  <h2 id=\"_3\">注意点</h2>  <ul> <li>振替伝票は売掛・買掛レポートには反映されません。債権・債務データの登録は取引(Deals)をお使いください。</li> <li>事業所の仕訳番号形式が有効な場合のみ、レスポンスで仕訳番号(txn_number)を返します。</li> <li>貸借合わせて100行まで仕訳行を登録できます。</li> <li>セグメントタグ情報は法人向けのプロフェッショナルプラン以上で利用可能です。利用可能なセグメントの数は、法人向けのプロフェッショナルプランの場合は1つ、エンタープライズプランの場合は3つです。</li> <li>partner_codeを利用するには、事業所の設定から取引先コードの利用を有効にする必要があります。またpartner_codeとpartner_idは同時に指定することはできません。</li></ul>  

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::ManualJournalsApi.new
opts = {
  manual_journal_create_params: UnofficialFreeeSdk::ManualJournalCreateParams.new # ManualJournalCreateParams | 振替伝票の作成
}

begin
  #振替伝票の作成
  result = api_instance.create_manual_journal(opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling ManualJournalsApi->create_manual_journal: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **manual_journal_create_params** | [**ManualJournalCreateParams**](ManualJournalCreateParams.md)| 振替伝票の作成 | [optional] 

### Return type

[**ManualJournalResponse**](ManualJournalResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json


## destroy_manual_journal

> destroy_manual_journal(id, company_id)

振替伝票の削除

 <h2 id=\"\">概要</h2>  <p>指定した事業所の振替伝票を削除する</p>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::ManualJournalsApi.new
id = 56 # Integer | 
company_id = 56 # Integer | 事業所ID

begin
  #振替伝票の削除
  api_instance.destroy_manual_journal(id, company_id)
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling ManualJournalsApi->destroy_manual_journal: #{e}"
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


## get_manual_journal

> ManualJournalResponse get_manual_journal(company_id, id)

振替伝票の取得

 <h2 id=\"\">概要</h2>  <p>指定した事業所の振替伝票を取得する</p>  <h2 id=\"_2\">定義</h2>  <ul> <li> <p>issue_date : 発生日</p> </li> <li> <p>adjustment : 決算整理仕訳フラグ（true: 決算整理仕訳, false: 日常仕訳）</p> </li> <li> <p>txn_number : 仕訳番号</p> </li> <li> <p>details : 振替伝票の貸借行</p> </li> <li> <p>entry_side : 貸借区分</p> <ul> <li>credit : 貸方</li> <li>debit : 借方</li> </ul> </li> <li> <p>amount : 金額</p> </li> </ul>  <h2 id=\"_3\">注意点</h2>  <ul> <li>振替伝票は売掛・買掛レポートには反映されません。債権・債務データの登録は取引(Deals)をお使いください。</li> <li>事業所の仕訳番号形式が有効な場合のみ、レスポンスで仕訳番号(txn_number)を返します。</li> <li>セグメントタグ情報は法人向けのプロフェッショナルプラン以上で利用可能です。利用可能なセグメントの数は、法人向けのプロフェッショナルプランの場合は1つ、エンタープライズプランの場合は3つです。</li> </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::ManualJournalsApi.new
company_id = 56 # Integer | 事業所ID
id = 56 # Integer | 

begin
  #振替伝票の取得
  result = api_instance.get_manual_journal(company_id, id)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling ManualJournalsApi->get_manual_journal: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **company_id** | **Integer**| 事業所ID | 
 **id** | **Integer**|  | 

### Return type

[**ManualJournalResponse**](ManualJournalResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_manual_journals

> InlineResponse2006 get_manual_journals(company_id, opts)

振替伝票一覧の取得

 <h2 id=\"\">概要</h2>  <p>指定した事業所の振替伝票一覧を取得する</p>  <h2 id=\"_2\">定義</h2>  <ul> <li> <p>issue_date : 発生日</p> </li>  <li> <p>adjustment : 決算整理仕訳フラグ（true: 決算整理仕訳, false: 日常仕訳）</p> </li>  <li> <p>txn_number : 仕訳番号</p> </li>  <li> <p>details : 振替伝票の貸借行</p> </li>  <li> <p>entry_side : 貸借区分</p>  <ul> <li>credit : 貸方</li>  <li>debit : 借方</li> </ul> </li>  <li> <p>amount : 金額</p> </li> </ul>  <h2 id=\"_3\">注意点</h2>  <ul> <li>振替伝票は売掛・買掛レポートには反映されません。債権・債務データの登録は取引(Deals)をお使いください。</li> <li>事業所の仕訳番号形式が有効な場合のみ、レスポンスで仕訳番号(txn_number)を返します。</li> <li>セグメントタグ情報は法人向けのプロフェッショナルプラン以上で利用可能です。利用可能なセグメントの数は、法人向けのプロフェッショナルプランの場合は1つ、エンタープライズプランの場合は3つです。</li> <li>partner_codeを利用するには、事業所の設定から取引先コードの利用を有効にする必要があります。またpartner_codeとpartner_idは同時に指定することはできません。</li></ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::ManualJournalsApi.new
company_id = 56 # Integer | 事業所ID
opts = {
  start_issue_date: 'start_issue_date_example', # String | 発生日で絞込：開始日(yyyy-mm-dd)
  end_issue_date: 'end_issue_date_example', # String | 発生日で絞込：終了日(yyyy-mm-dd)
  entry_side: 'entry_side_example', # String | 貸借で絞込 (貸方: credit, 借方: debit)
  account_item_id: 56, # Integer | 勘定科目IDで絞込
  min_amount: 56, # Integer | 金額で絞込：下限
  max_amount: 56, # Integer | 金額で絞込：上限
  partner_id: 56, # Integer | 取引先IDで絞込（0を指定すると、取引先が未選択の貸借行を絞り込めます）
  partner_code: 'partner_code_example', # String | 取引先コードで絞込
  item_id: 56, # Integer | 品目IDで絞込（0を指定すると、品目が未選択の貸借行を絞り込めます）
  section_id: 56, # Integer | 部門IDで絞込（0を指定すると、部門が未選択の貸借行を絞り込めます）
  segment_1_tag_id: 56, # Integer | セグメント１IDで絞り込み（0を指定すると、セグメント１が未選択の貸借行を絞り込めます）
  segment_2_tag_id: 56, # Integer | セグメント２IDで絞り込み（0を指定すると、セグメント２が未選択の貸借行を絞り込めます）
  segment_3_tag_id: 56, # Integer | セグメント３IDで絞り込み（0を指定すると、セグメント３が未選択の貸借行を絞り込めます）
  comment_status: 'comment_status_example', # String | コメント状態で絞込（自分宛のコメント: posted_with_mention, 自分宛のコメント-未解決: raised_with_mention, 自分宛のコメント-解決済: resolved_with_mention, コメントあり: posted, 未解決: raised, 解決済: resolved, コメントなし: none）
  comment_important: true, # Boolean | 重要コメント付きの振替伝票を絞込
  adjustment: 'adjustment_example', # String | 決算整理仕訳で絞込（決算整理仕訳のみ: only, 決算整理仕訳以外: without）
  txn_number: 'txn_number_example', # String | 仕訳番号で絞込（事業所の仕訳番号形式が有効な場合のみ）
  offset: 56, # Integer | 取得レコードのオフセット (デフォルト: 0)
  limit: 56 # Integer | 取得レコードの件数 (デフォルト: 20, 最小: 1, 最大: 500) 
}

begin
  #振替伝票一覧の取得
  result = api_instance.get_manual_journals(company_id, opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling ManualJournalsApi->get_manual_journals: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **company_id** | **Integer**| 事業所ID | 
 **start_issue_date** | **String**| 発生日で絞込：開始日(yyyy-mm-dd) | [optional] 
 **end_issue_date** | **String**| 発生日で絞込：終了日(yyyy-mm-dd) | [optional] 
 **entry_side** | **String**| 貸借で絞込 (貸方: credit, 借方: debit) | [optional] 
 **account_item_id** | **Integer**| 勘定科目IDで絞込 | [optional] 
 **min_amount** | **Integer**| 金額で絞込：下限 | [optional] 
 **max_amount** | **Integer**| 金額で絞込：上限 | [optional] 
 **partner_id** | **Integer**| 取引先IDで絞込（0を指定すると、取引先が未選択の貸借行を絞り込めます） | [optional] 
 **partner_code** | **String**| 取引先コードで絞込 | [optional] 
 **item_id** | **Integer**| 品目IDで絞込（0を指定すると、品目が未選択の貸借行を絞り込めます） | [optional] 
 **section_id** | **Integer**| 部門IDで絞込（0を指定すると、部門が未選択の貸借行を絞り込めます） | [optional] 
 **segment_1_tag_id** | **Integer**| セグメント１IDで絞り込み（0を指定すると、セグメント１が未選択の貸借行を絞り込めます） | [optional] 
 **segment_2_tag_id** | **Integer**| セグメント２IDで絞り込み（0を指定すると、セグメント２が未選択の貸借行を絞り込めます） | [optional] 
 **segment_3_tag_id** | **Integer**| セグメント３IDで絞り込み（0を指定すると、セグメント３が未選択の貸借行を絞り込めます） | [optional] 
 **comment_status** | **String**| コメント状態で絞込（自分宛のコメント: posted_with_mention, 自分宛のコメント-未解決: raised_with_mention, 自分宛のコメント-解決済: resolved_with_mention, コメントあり: posted, 未解決: raised, 解決済: resolved, コメントなし: none） | [optional] 
 **comment_important** | **Boolean**| 重要コメント付きの振替伝票を絞込 | [optional] 
 **adjustment** | **String**| 決算整理仕訳で絞込（決算整理仕訳のみ: only, 決算整理仕訳以外: without） | [optional] 
 **txn_number** | **String**| 仕訳番号で絞込（事業所の仕訳番号形式が有効な場合のみ） | [optional] 
 **offset** | **Integer**| 取得レコードのオフセット (デフォルト: 0) | [optional] 
 **limit** | **Integer**| 取得レコードの件数 (デフォルト: 20, 最小: 1, 最大: 500)  | [optional] 

### Return type

[**InlineResponse2006**](InlineResponse2006.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_manual_journal

> ManualJournalResponse update_manual_journal(id, opts)

振替伝票の更新

 <h2 id=\"\">概要</h2>  <p>指定した事業所の振替伝票を更新する</p>  <h2 id=\"_2\">定義</h2>  <ul> <li> <p>issue_date : 発生日</p> </li>  <li> <p>adjustment : 決算整理仕訳フラグ（true: 決算整理仕訳, false: 日常仕訳）</p> </li>  <li> <p>txn_number : 仕訳番号</p> </li>  <li> <p>details : 振替伝票の貸借行</p> </li>  <li> <p>entry_side : 貸借区分</p>  <ul> <li>credit : 貸方</li>  <li>debit : 借方</li> </ul> </li>  <li> <p>amount : 金額</p> </li> </ul>  <h2 id=\"_3\">注意点</h2>  <ul> <li>振替伝票は売掛・買掛レポートには反映されません。債権・債務データの登録は取引(Deals)をお使いください。</li>  <li>事業所の仕訳番号形式が有効な場合のみ、レスポンスで仕訳番号(txn_number)を返します。</li> <li>貸借合わせて100行まで仕訳行を登録できます。</li>  <li>detailsに含まれない既存の貸借行は削除されます。更新後も残したい行は、必ず貸借行IDを指定してdetailsに含めてください。</li>  <li>detailsに含まれる貸借行IDの指定がある行は、更新行として扱われ更新されます。</li>  <li>detailsに含まれる貸借行IDの指定がない行は、新規行として扱われ追加されます。</li> <li>セグメントタグ情報は法人向けのプロフェッショナルプラン以上で利用可能です。利用可能なセグメントの数は、法人向けのプロフェッショナルプランの場合は1つ、エンタープライズプランの場合は3つです。</li> <li>partner_codeを利用するには、事業所の設定から取引先コードの利用を有効にする必要があります。またpartner_codeとpartner_idは同時に指定することはできません。</li></ul>  

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::ManualJournalsApi.new
id = 56 # Integer | 
opts = {
  manual_journal_update_params: UnofficialFreeeSdk::ManualJournalUpdateParams.new # ManualJournalUpdateParams | 振替伝票の更新
}

begin
  #振替伝票の更新
  result = api_instance.update_manual_journal(id, opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling ManualJournalsApi->update_manual_journal: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**|  | 
 **manual_journal_update_params** | [**ManualJournalUpdateParams**](ManualJournalUpdateParams.md)| 振替伝票の更新 | [optional] 

### Return type

[**ManualJournalResponse**](ManualJournalResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json

