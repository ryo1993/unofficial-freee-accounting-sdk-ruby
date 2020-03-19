# UnofficialFreeeSdk::JournalStatusResponseJournals

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 受け付けID | 
**company_id** | **Integer** | 事業所ID | 
**download_type** | **String** | ダウンロード形式 | 
**status** | **String** | 事業所ID | 
**start_date** | **String** | 取得開始日 (yyyy-mm-dd) | 
**end_date** | **String** | 取得終了日 (yyyy-mm-dd) | 
**visible_tags** | **Array&lt;String&gt;** |  | 
**download_url** | **String** | ダウンロードURL | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::JournalStatusResponseJournals.new(id: 1,
                                 company_id: 1,
                                 download_type: csv,
                                 status: csv,
                                 start_date: 2017-05-01,
                                 end_date: 2017-05-31,
                                 visible_tags: null,
                                 download_url: https://api.freee.co.jp/api/1/journals/reports/1/download)
```


