# UnofficialFreeeSdk::ApprovalRequestResponseApprovalRequest

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 各種申請ID | 
**company_id** | **Integer** | 事業所ID | 
**application_date** | **String** | 申請日 (yyyy-mm-dd) | 
**title** | **String** | 申請タイトル | 
**applicant_id** | **Integer** | 申請者ID | 
**approver_id** | **Integer** | 承認者ID | 
**application_number** | **String** | 申請No. | 
**status** | **String** | 申請ステータス | 
**request_items** | [**Array&lt;ApprovalRequestResponseApprovalRequestRequestItems&gt;**](ApprovalRequestResponseApprovalRequestRequestItems.md) | 各種申請の項目一覧（配列） | 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::ApprovalRequestResponseApprovalRequest.new(id: 1,
                                 company_id: 1,
                                 application_date: 2018-07-19,
                                 title: 大阪出張,
                                 applicant_id: 1,
                                 approver_id: 1,
                                 application_number: 2,
                                 status: draft,
                                 request_items: null)
```


