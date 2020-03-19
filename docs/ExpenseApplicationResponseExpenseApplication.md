# UnofficialFreeeSdk::ExpenseApplicationResponseExpenseApplication

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 経費申請ID | 
**company_id** | **Integer** | 事業所ID | 
**title** | **String** | 申請タイトル | 
**issue_date** | **String** | 申請日 (yyyy-mm-dd) | 
**description** | **String** | 備考 | [optional] 
**editable_on_web** | **Boolean** | 会計freeeのWeb画面から申請内容を編集可能：falseの場合、Web上からの項目行の追加／削除・金額の編集が出来なくなります。APIでの編集は可能です。 | 
**total_amount** | **Integer** | 合計金額 | [optional] 
**status** | **String** | 申請ステータス | 
**section_id** | **Integer** | 部門ID | [optional] 
**tag_ids** | **Array&lt;Integer&gt;** | メモタグID | [optional] 
**expense_application_lines** | [**Array&lt;ExpenseApplicationResponseExpenseApplicationExpenseApplicationLines&gt;**](ExpenseApplicationResponseExpenseApplicationExpenseApplicationLines.md) | 経費申請の項目行一覧（配列） | 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::ExpenseApplicationResponseExpenseApplication.new(id: 1,
                                 company_id: 1,
                                 title: 大阪出張,
                                 issue_date: 2018-07-19,
                                 description: ◯◯連携先ID: cx12345,
                                 editable_on_web: false,
                                 total_amount: 30000,
                                 status: draft,
                                 section_id: 101,
                                 tag_ids: null,
                                 expense_application_lines: null)
```


