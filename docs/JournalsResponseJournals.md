# UnofficialFreeeSdk::JournalsResponseJournals

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 受け付けID | 
**messages** | **String** | 受け付けメッセージ | [optional] 
**company_id** | **Integer** | 事業所ID | 
**download_type** | **String** | ダウンロード形式 | [optional] 
**start_date** | **String** | 取得開始日 (yyyy-mm-dd) | [optional] 
**end_date** | **String** | 取得終了日 (yyyy-mm-dd) | [optional] 
**visible_tags** | **Array&lt;String&gt;** |  | [optional] 
**status_url** | **String** | ステータス確認用URL | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::JournalsResponseJournals.new(id: 1,
                                 messages: :id でリクエストを受け付けました。,
                                 company_id: 1,
                                 download_type: csv,
                                 start_date: 2017-05-01,
                                 end_date: 2017-05-31,
                                 visible_tags: null,
                                 status_url: https://api.freee.co.jp/api/1/journals/reports/4/status)
```


