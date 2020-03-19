# UnofficialFreeeSdk::JournalsApi

All URIs are relative to *https://api.freee.co.jp*

Method | HTTP request | Description
------------- | ------------- | -------------
[**download_journal**](JournalsApi.md#download_journal) | **GET** /api/1/journals/reports/{id}/download | ダウンロード実行
[**get_journal_status**](JournalsApi.md#get_journal_status) | **GET** /api/1/journals/reports/{id}/status | ステータス確認
[**get_journals**](JournalsApi.md#get_journals) | **GET** /api/1/journals | ダウンロード要求



## download_journal

> String download_journal(id, company_id)

ダウンロード実行

 <h2 id=\"\">概要</h2>  <p>ダウンロードを実行する</p>  <p>＊このAPIは無料プランのアカウントではご利用になれません</p>  <h2 id=\"_2\">定義</h2>  <ul> <li>id : 受け付けID</li> </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::JournalsApi.new
id = 56 # Integer | 受け付けID
company_id = 56 # Integer | 事業所ID

begin
  #ダウンロード実行
  result = api_instance.download_journal(id, company_id)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling JournalsApi->download_journal: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| 受け付けID | 
 **company_id** | **Integer**| 事業所ID | 

### Return type

**String**

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: text/csv, application/pdf, application/json


## get_journal_status

> JournalStatusResponse get_journal_status(company_id, id, opts)

ステータス確認

 <h2 id=\"\">概要</h2>  <p>ダウンロードリクエストのステータスを確認する</p>  <p>＊このAPIは無料プランのアカウントではご利用になれません</p>  <h2 id=\"_2\">定義</h2>  <ul> <li> <p>status</p>  <ul> <li>enqueued : 実行待ち</li>  <li>working : 実行中</li>  <li>uploaded : 準備完了</li> </ul> </li>  <li> <p>id : 受け付けID</p> </li> </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::JournalsApi.new
company_id = 56 # Integer | 事業所ID
id = 56 # Integer | 受け付けID
opts = {
  visible_tags: ['visible_tags_example'], # Array<String> | 補助科目やコメントとして出力する項目
  start_date: 'start_date_example', # String | 取得開始日 (yyyy-mm-dd)
  end_date: 'end_date_example' # String | 取得終了日 (yyyy-mm-dd)
}

begin
  #ステータス確認
  result = api_instance.get_journal_status(company_id, id, opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling JournalsApi->get_journal_status: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **company_id** | **Integer**| 事業所ID | 
 **id** | **Integer**| 受け付けID | 
 **visible_tags** | [**Array&lt;String&gt;**](String.md)| 補助科目やコメントとして出力する項目 | [optional] 
 **start_date** | **String**| 取得開始日 (yyyy-mm-dd) | [optional] 
 **end_date** | **String**| 取得終了日 (yyyy-mm-dd) | [optional] 

### Return type

[**JournalStatusResponse**](JournalStatusResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_journals

> JournalsResponse get_journals(download_type, company_id, opts)

ダウンロード要求

 <h2 id=\"\">概要</h2>  <p>ユーザが所属する事業所の仕訳帳のダウンロードをリクエストします 生成されるファイルに関しては、<a href=\"https://support.freee.co.jp/hc/ja/articles/204599604#2\">ヘルプページ</a>をご参照ください</p>  <p>＊このAPIは無料プランのアカウントではご利用になれません</p>  <h2 id=\"_2\">定義</h2>  <ul> <li>download_type <ul> <li>generic(freee Webからダウンロードできるものと同じ)</li>  <li>csv (yayoi形式)</li>  <li>pdf</li> </ul> </li>  <li>visible_tags : 指定しない場合は従来の仕様の仕訳帳が出力されます <ul> <li>partner : 取引先タグ</li>  <li>item : 品目タグ</li>  <li>tag : メモタグ</li>  <li>section : 部門タグ</li>  <li>description : 備考欄</li>  <li>wallet_txn_description : 明細の備考欄</li>  <li>all : 指定された場合は上記の設定をすべて有効として扱います</li> </ul> </li>  <li>id : 受け付けID</li> </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::JournalsApi.new
download_type = 'download_type_example' # String | ダウンロード形式
company_id = 56 # Integer | 事業所ID
opts = {
  visible_tags: ['visible_tags_example'], # Array<String> | 補助科目やコメントとして出力する項目
  start_date: 'start_date_example', # String | 取得開始日 (yyyy-mm-dd)
  end_date: 'end_date_example' # String | 取得終了日 (yyyy-mm-dd)
}

begin
  #ダウンロード要求
  result = api_instance.get_journals(download_type, company_id, opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling JournalsApi->get_journals: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **download_type** | **String**| ダウンロード形式 | 
 **company_id** | **Integer**| 事業所ID | 
 **visible_tags** | [**Array&lt;String&gt;**](String.md)| 補助科目やコメントとして出力する項目 | [optional] 
 **start_date** | **String**| 取得開始日 (yyyy-mm-dd) | [optional] 
 **end_date** | **String**| 取得終了日 (yyyy-mm-dd) | [optional] 

### Return type

[**JournalsResponse**](JournalsResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

