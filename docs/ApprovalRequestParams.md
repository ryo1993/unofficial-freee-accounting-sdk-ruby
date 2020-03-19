# UnofficialFreeeSdk::ApprovalRequestParams

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**company_id** | **Integer** | 事業所ID | 
**request_form_id** | **Integer** | 申請フォームID | 
**approval_flow_route_id** | **Integer** | 経路申請ID | 
**approver_id** | **Integer** | 承認者ID | [optional] 
**title** | **String** | 申請タイトル (255文字以内) | 
**request_items** | [**Array&lt;ApprovalRequestParamsRequestItems&gt;**](ApprovalRequestParamsRequestItems.md) |  | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::ApprovalRequestParams.new(company_id: 1,
                                 request_form_id: 1,
                                 approval_flow_route_id: 1,
                                 approver_id: 1,
                                 title: 大阪出張,
                                 request_items: null)
```


