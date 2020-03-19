# UnofficialFreeeSdk::ManualJournalUpdateParams

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**company_id** | **Integer** | 事業所ID | 
**issue_date** | **String** | 発生日 (yyyy-mm-dd) | 
**adjustment** | **Boolean** | 決算整理仕訳フラグ（falseまたは未指定の場合: 日常仕訳） | [optional] 
**details** | [**Array&lt;ManualJournalUpdateParamsDetails&gt;**](ManualJournalUpdateParamsDetails.md) |  | 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::ManualJournalUpdateParams.new(company_id: 1,
                                 issue_date: 2013-01-01,
                                 adjustment: false,
                                 details: null)
```


