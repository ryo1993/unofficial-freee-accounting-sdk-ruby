# UnofficialFreeeSdk::DealResponseDealReceipts

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 証憑ID | 
**status** | **String** | ステータス(unconfirmed:確認待ち、confirmed:確認済み、deleted:削除済み、ignored:無視) | 
**description** | **String** | メモ | [optional] 
**mime_type** | **String** | MIMEタイプ | 
**issue_date** | **String** | 発生日 | [optional] 
**origin** | **String** | アップロード元種別 | 
**created_at** | **String** | 作成日時（ISO8601形式） | 
**file_src** | **String** | ファイルのダウンロードURL（freeeにログインした状態でのみ閲覧可能です。） | 
**user** | [**DealResponseDealUser**](DealResponseDealUser.md) |  | 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::DealResponseDealReceipts.new(id: 1,
                                 status: unconfirmed,
                                 description: タクシー利用,
                                 mime_type: image/png,
                                 issue_date: 2019-01-01,
                                 origin: public_api,
                                 created_at: 2018-09-12T18:30:24+09:00,
                                 file_src: https://www.freee.co.jp/api/p/receipts/revisions/1234xxxxx/download,
                                 user: null)
```


