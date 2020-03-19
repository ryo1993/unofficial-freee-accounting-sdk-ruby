# UnofficialFreeeSdk::ExpenseApplicationCreateParams

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**company_id** | **Integer** | 事業所ID | 
**title** | **String** | 申請タイトル (250文字以内) | 
**issue_date** | **String** | 申請日 (yyyy-mm-dd) | 
**description** | **String** | 備考 (10000文字以内) | [optional] 
**editable_on_web** | **Boolean** | 会計freeeのWeb画面から申請内容を編集可能（デフォルト: false）：falseの場合、Web上からの項目行の追加／削除・金額の編集が出来なくなります。APIでの編集は可能です。 | [optional] 
**section_id** | **Integer** | 部門ID | [optional] 
**tag_ids** | **Array&lt;Integer&gt;** | メモタグID | [optional] 
**expense_application_lines** | [**Array&lt;ExpenseApplicationCreateParamsExpenseApplicationLines&gt;**](ExpenseApplicationCreateParamsExpenseApplicationLines.md) |  | 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::ExpenseApplicationCreateParams.new(company_id: 1,
                                 title: 大阪出張,
                                 issue_date: 2018-07-19,
                                 description: ◯◯連携先ID: cx12345,
                                 editable_on_web: false,
                                 section_id: 101,
                                 tag_ids: null,
                                 expense_application_lines: null)
```


