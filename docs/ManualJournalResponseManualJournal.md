# UnofficialFreeeSdk::ManualJournalResponseManualJournal

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 振替伝票ID | 
**company_id** | **Integer** | 事業所ID | 
**issue_date** | **String** | 発生日 (yyyy-mm-dd) | 
**adjustment** | **Boolean** | 決算整理仕訳フラグ（falseまたは未指定の場合: 日常仕訳） | 
**txn_number** | **String** | 仕訳番号 | 
**details** | [**Array&lt;ManualJournalResponseManualJournalDetails&gt;**](ManualJournalResponseManualJournalDetails.md) | 貸借行一覧（配列）: 貸借合わせて100行まで登録できます。 | 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::ManualJournalResponseManualJournal.new(id: 1,
                                 company_id: 1,
                                 issue_date: 2018-01-01,
                                 adjustment: false,
                                 txn_number: 2CX05,
                                 details: null)
```


