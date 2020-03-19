# UnofficialFreeeSdk::InlineResponse2008

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**wallet_txns** | [**UserCapability**](UserCapability.md) |  | 
**deals** | [**UserCapability**](UserCapability.md) |  | 
**transfers** | [**UserCapability**](UserCapability.md) |  | 
**docs** | [**UserCapability**](UserCapability.md) |  | 
**doc_postings** | [**UserCapability**](UserCapability.md) |  | 
**receipts** | [**UserCapability**](UserCapability.md) |  | 
**receipt_stream_editor** | [**UserCapability**](UserCapability.md) |  | 
**expense_applications** | [**UserCapability**](UserCapability.md) |  | 
**spreadsheets** | [**UserCapability**](UserCapability.md) |  | 
**payment_requests** | [**UserCapability**](UserCapability.md) |  | 
**request_forms** | [**UserCapability**](UserCapability.md) |  | 
**approval_requests** | [**UserCapability**](UserCapability.md) |  | 
**reports** | [**UserCapability**](UserCapability.md) |  | 
**reports_income_expense** | [**UserCapability**](UserCapability.md) |  | 
**reports_receivables** | [**UserCapability**](UserCapability.md) |  | 
**reports_payables** | [**UserCapability**](UserCapability.md) |  | 
**reports_cash_balance** | [**UserCapability**](UserCapability.md) |  | 
**reports_crosstabs** | [**UserCapability**](UserCapability.md) |  | 
**reports_general_ledgers** | [**UserCapability**](UserCapability.md) |  | 
**reports_pl** | [**UserCapability**](UserCapability.md) |  | 
**reports_bs** | [**UserCapability**](UserCapability.md) |  | 
**reports_journals** | [**UserCapability**](UserCapability.md) |  | 
**reports_managements_planning** | [**UserCapability**](UserCapability.md) |  | 
**reports_managements_navigation** | [**UserCapability**](UserCapability.md) |  | 
**manual_journals** | [**UserCapability**](UserCapability.md) |  | 
**fixed_assets** | [**UserCapability**](UserCapability.md) |  | 
**inventory_refreshes** | [**UserCapability**](UserCapability.md) |  | 
**biz_allocations** | [**UserCapability**](UserCapability.md) |  | 
**payment_records** | [**UserCapability**](UserCapability.md) |  | 
**annual_reports** | [**UserCapability**](UserCapability.md) |  | 
**tax_reports** | [**UserCapability**](UserCapability.md) |  | 
**consumption_entries** | [**UserCapability**](UserCapability.md) |  | 
**tax_return** | [**UserCapability**](UserCapability.md) |  | 
**account_item_statements** | [**UserCapability**](UserCapability.md) |  | 
**month_end** | [**UserCapability**](UserCapability.md) |  | 
**year_end** | [**UserCapability**](UserCapability.md) |  | 
**walletables** | [**UserCapability**](UserCapability.md) |  | 
**companies** | [**UserCapability**](UserCapability.md) |  | 
**invitations** | [**UserCapability**](UserCapability.md) |  | 
**sign_in_logs** | [**UserCapability**](UserCapability.md) |  | 
**backups** | [**UserCapability**](UserCapability.md) |  | 
**opening_balances** | [**UserCapability**](UserCapability.md) |  | 
**system_conversion** | [**UserCapability**](UserCapability.md) |  | 
**resets** | [**UserCapability**](UserCapability.md) |  | 
**partners** | [**UserCapability**](UserCapability.md) |  | 
**items** | [**UserCapability**](UserCapability.md) |  | 
**sections** | [**UserCapability**](UserCapability.md) |  | 
**tags** | [**UserCapability**](UserCapability.md) |  | 
**account_items** | [**UserCapability**](UserCapability.md) |  | 
**taxes** | [**UserCapability**](UserCapability.md) |  | 
**user_matchers** | [**UserCapability**](UserCapability.md) |  | 
**deal_templates** | [**UserCapability**](UserCapability.md) |  | 
**manual_journal_templates** | [**UserCapability**](UserCapability.md) |  | 
**cost_allocations** | [**UserCapability**](UserCapability.md) |  | 
**approval_flow_routes** | [**UserCapability**](UserCapability.md) |  | 
**expense_application_templates** | [**UserCapability**](UserCapability.md) |  | 
**workflows** | [**UserCapability**](UserCapability.md) |  | 
**oauth_applications** | [**UserCapability**](UserCapability.md) |  | 
**oauth_authorizations** | [**UserCapability**](UserCapability.md) |  | 
**bank_accountant_staff_users** | [**UserCapability**](UserCapability.md) |  | 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::InlineResponse2008.new(wallet_txns: null,
                                 deals: null,
                                 transfers: null,
                                 docs: null,
                                 doc_postings: null,
                                 receipts: null,
                                 receipt_stream_editor: null,
                                 expense_applications: null,
                                 spreadsheets: null,
                                 payment_requests: null,
                                 request_forms: null,
                                 approval_requests: null,
                                 reports: null,
                                 reports_income_expense: null,
                                 reports_receivables: null,
                                 reports_payables: null,
                                 reports_cash_balance: null,
                                 reports_crosstabs: null,
                                 reports_general_ledgers: null,
                                 reports_pl: null,
                                 reports_bs: null,
                                 reports_journals: null,
                                 reports_managements_planning: null,
                                 reports_managements_navigation: null,
                                 manual_journals: null,
                                 fixed_assets: null,
                                 inventory_refreshes: null,
                                 biz_allocations: null,
                                 payment_records: null,
                                 annual_reports: null,
                                 tax_reports: null,
                                 consumption_entries: null,
                                 tax_return: null,
                                 account_item_statements: null,
                                 month_end: null,
                                 year_end: null,
                                 walletables: null,
                                 companies: null,
                                 invitations: null,
                                 sign_in_logs: null,
                                 backups: null,
                                 opening_balances: null,
                                 system_conversion: null,
                                 resets: null,
                                 partners: null,
                                 items: null,
                                 sections: null,
                                 tags: null,
                                 account_items: null,
                                 taxes: null,
                                 user_matchers: null,
                                 deal_templates: null,
                                 manual_journal_templates: null,
                                 cost_allocations: null,
                                 approval_flow_routes: null,
                                 expense_application_templates: null,
                                 workflows: null,
                                 oauth_applications: null,
                                 oauth_authorizations: null,
                                 bank_accountant_staff_users: null)
```


