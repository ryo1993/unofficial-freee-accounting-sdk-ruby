# unofficial_freee_sdk

非公式の会計freee APIを ruby で利用するための SDK です。

参考：[freee Developers Community](https://developer.freee.co.jp/)

## Installation

### Build a gem

To build the Ruby code into a gem:

```shell
gem build unofficial_freee_sdk.gemspec
```

Then either install the gem locally:

```shell
gem install ./unofficial_freee_sdk-1.0.0.gem
```

(for development, run `gem install --dev ./unofficial_freee_sdk-1.0.0.gem` to install the development dependencies)

or publish the gem to a gem hosting service, e.g. [RubyGems](https://rubygems.org/).

Finally add this to the Gemfile:

    gem 'unofficial_freee_sdk', '~> 1.0.0'

### Install from Git

If the Ruby gem is hosted at a git repository: https://github.com/GIT_USER_ID/GIT_REPO_ID, then add the following in the Gemfile:

    gem 'unofficial_freee_sdk', :git => 'https://github.com/GIT_USER_ID/GIT_REPO_ID.git'

### Include the Ruby code directly

Include the Ruby code directly using `-I` as follows:

```shell
ruby -Ilib script.rb
```

## Getting Started

Please follow the [installation](#installation) procedure and then run the following code:

```ruby
# Load the gem
require 'unofficial_freee_sdk'

# Setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::AccountItemsApi.new
account_item_params = UnofficialFreeeSdk::AccountItemParams.new # AccountItemParams | 勘定科目の作成

begin
  #勘定科目の作成
  result = api_instance.create_account_item(account_item_params)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling AccountItemsApi->create_account_item: #{e}"
end

```

## Documentation for API Endpoints

All URIs are relative to *https://api.freee.co.jp*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*UnofficialFreeeSdk::AccountItemsApi* | [**create_account_item**](docs/AccountItemsApi.md#create_account_item) | **POST** /api/1/account_items | 勘定科目の作成
*UnofficialFreeeSdk::AccountItemsApi* | [**destroy_account_item**](docs/AccountItemsApi.md#destroy_account_item) | **DELETE** /api/1/account_items/{id} | 勘定科目の削除
*UnofficialFreeeSdk::AccountItemsApi* | [**get_account_item**](docs/AccountItemsApi.md#get_account_item) | **GET** /api/1/account_items/{id} | 勘定科目の詳細情報の取得
*UnofficialFreeeSdk::AccountItemsApi* | [**get_account_items**](docs/AccountItemsApi.md#get_account_items) | **GET** /api/1/account_items | 勘定科目一覧の取得
*UnofficialFreeeSdk::AccountItemsApi* | [**update_account_item**](docs/AccountItemsApi.md#update_account_item) | **PUT** /api/1/account_items/{id} | 勘定科目の更新
*UnofficialFreeeSdk::BanksApi* | [**get_bank**](docs/BanksApi.md#get_bank) | **GET** /api/1/banks/{id} | 連携サービスの取得
*UnofficialFreeeSdk::BanksApi* | [**get_banks**](docs/BanksApi.md#get_banks) | **GET** /api/1/banks | 連携サービス一覧の取得
*UnofficialFreeeSdk::CompaniesApi* | [**get_companies**](docs/CompaniesApi.md#get_companies) | **GET** /api/1/companies | 事業所一覧の取得
*UnofficialFreeeSdk::CompaniesApi* | [**get_company**](docs/CompaniesApi.md#get_company) | **GET** /api/1/companies/{id} | 事業所の詳細情報の取得
*UnofficialFreeeSdk::CompaniesApi* | [**update_company**](docs/CompaniesApi.md#update_company) | **PUT** /api/1/companies/{id} | 事業所情報の更新
*UnofficialFreeeSdk::DealsApi* | [**create_deal**](docs/DealsApi.md#create_deal) | **POST** /api/1/deals | 取引（収入／支出）の作成
*UnofficialFreeeSdk::DealsApi* | [**destroy_deal**](docs/DealsApi.md#destroy_deal) | **DELETE** /api/1/deals/{id} | 取引（収入／支出）の削除
*UnofficialFreeeSdk::DealsApi* | [**get_deal**](docs/DealsApi.md#get_deal) | **GET** /api/1/deals/{id} | 取引（収入／支出）の取得
*UnofficialFreeeSdk::DealsApi* | [**get_deals**](docs/DealsApi.md#get_deals) | **GET** /api/1/deals | 取引（収入／支出）一覧の取得
*UnofficialFreeeSdk::DealsApi* | [**update_deal**](docs/DealsApi.md#update_deal) | **PUT** /api/1/deals/{id} | 取引（収入／支出）の更新
*UnofficialFreeeSdk::ExpenseApplicationLineTemplatesApi* | [**create_expense_application_line_template**](docs/ExpenseApplicationLineTemplatesApi.md#create_expense_application_line_template) | **POST** /api/1/expense_application_line_templates | 経費科目の作成
*UnofficialFreeeSdk::ExpenseApplicationLineTemplatesApi* | [**destroy_expense_application_line_template**](docs/ExpenseApplicationLineTemplatesApi.md#destroy_expense_application_line_template) | **DELETE** /api/1/expense_application_line_templates/{id} | 経費科目の削除
*UnofficialFreeeSdk::ExpenseApplicationLineTemplatesApi* | [**get_expense_application_line_template**](docs/ExpenseApplicationLineTemplatesApi.md#get_expense_application_line_template) | **GET** /api/1/expense_application_line_templates/{id} | 経費科目の取得
*UnofficialFreeeSdk::ExpenseApplicationLineTemplatesApi* | [**get_expense_application_line_templates**](docs/ExpenseApplicationLineTemplatesApi.md#get_expense_application_line_templates) | **GET** /api/1/expense_application_line_templates | 経費科目一覧の取得
*UnofficialFreeeSdk::ExpenseApplicationLineTemplatesApi* | [**update_expense_application_line_template**](docs/ExpenseApplicationLineTemplatesApi.md#update_expense_application_line_template) | **PUT** /api/1/expense_application_line_templates/{id} | 経費科目の更新
*UnofficialFreeeSdk::ExpenseApplicationsApi* | [**create_expense_application**](docs/ExpenseApplicationsApi.md#create_expense_application) | **POST** /api/1/expense_applications | 経費申請の作成
*UnofficialFreeeSdk::ExpenseApplicationsApi* | [**destroy_expense_application**](docs/ExpenseApplicationsApi.md#destroy_expense_application) | **DELETE** /api/1/expense_applications/{id} | 経費申請の削除
*UnofficialFreeeSdk::ExpenseApplicationsApi* | [**get_expense_application**](docs/ExpenseApplicationsApi.md#get_expense_application) | **GET** /api/1/expense_applications/{id} | 経費申請詳細の取得
*UnofficialFreeeSdk::ExpenseApplicationsApi* | [**get_expense_applications**](docs/ExpenseApplicationsApi.md#get_expense_applications) | **GET** /api/1/expense_applications | 経費申請一覧の取得
*UnofficialFreeeSdk::ExpenseApplicationsApi* | [**update_expense_application**](docs/ExpenseApplicationsApi.md#update_expense_application) | **PUT** /api/1/expense_applications/{id} | 経費申請の更新
*UnofficialFreeeSdk::InvoicesApi* | [**create_invoice**](docs/InvoicesApi.md#create_invoice) | **POST** /api/1/invoices | 請求書の作成
*UnofficialFreeeSdk::InvoicesApi* | [**destroy_invoice**](docs/InvoicesApi.md#destroy_invoice) | **DELETE** /api/1/invoices/{id} | 請求書の削除
*UnofficialFreeeSdk::InvoicesApi* | [**get_invoice**](docs/InvoicesApi.md#get_invoice) | **GET** /api/1/invoices/{id} | 請求書の取得
*UnofficialFreeeSdk::InvoicesApi* | [**get_invoices**](docs/InvoicesApi.md#get_invoices) | **GET** /api/1/invoices | 請求書一覧の取得
*UnofficialFreeeSdk::InvoicesApi* | [**update_invoice**](docs/InvoicesApi.md#update_invoice) | **PUT** /api/1/invoices/{id} | 請求書の更新
*UnofficialFreeeSdk::ItemsApi* | [**create_item**](docs/ItemsApi.md#create_item) | **POST** /api/1/items | 品目の作成
*UnofficialFreeeSdk::ItemsApi* | [**destroy_item**](docs/ItemsApi.md#destroy_item) | **DELETE** /api/1/items/{id} | 品目の削除
*UnofficialFreeeSdk::ItemsApi* | [**get_item**](docs/ItemsApi.md#get_item) | **GET** /api/1/items/{id} | 品目の取得
*UnofficialFreeeSdk::ItemsApi* | [**get_items**](docs/ItemsApi.md#get_items) | **GET** /api/1/items | 品目一覧の取得
*UnofficialFreeeSdk::ItemsApi* | [**update_item**](docs/ItemsApi.md#update_item) | **PUT** /api/1/items/{id} | 品目の更新
*UnofficialFreeeSdk::JournalsApi* | [**download_journal**](docs/JournalsApi.md#download_journal) | **GET** /api/1/journals/reports/{id}/download | ダウンロード実行
*UnofficialFreeeSdk::JournalsApi* | [**get_journal_status**](docs/JournalsApi.md#get_journal_status) | **GET** /api/1/journals/reports/{id}/status | ステータス確認
*UnofficialFreeeSdk::JournalsApi* | [**get_journals**](docs/JournalsApi.md#get_journals) | **GET** /api/1/journals | ダウンロード要求
*UnofficialFreeeSdk::ManualJournalsApi* | [**create_manual_journal**](docs/ManualJournalsApi.md#create_manual_journal) | **POST** /api/1/manual_journals | 振替伝票の作成
*UnofficialFreeeSdk::ManualJournalsApi* | [**destroy_manual_journal**](docs/ManualJournalsApi.md#destroy_manual_journal) | **DELETE** /api/1/manual_journals/{id} | 振替伝票の削除
*UnofficialFreeeSdk::ManualJournalsApi* | [**get_manual_journal**](docs/ManualJournalsApi.md#get_manual_journal) | **GET** /api/1/manual_journals/{id} | 振替伝票の取得
*UnofficialFreeeSdk::ManualJournalsApi* | [**get_manual_journals**](docs/ManualJournalsApi.md#get_manual_journals) | **GET** /api/1/manual_journals | 振替伝票一覧の取得
*UnofficialFreeeSdk::ManualJournalsApi* | [**update_manual_journal**](docs/ManualJournalsApi.md#update_manual_journal) | **PUT** /api/1/manual_journals/{id} | 振替伝票の更新
*UnofficialFreeeSdk::PartnersApi* | [**create_partner**](docs/PartnersApi.md#create_partner) | **POST** /api/1/partners | 取引先の作成
*UnofficialFreeeSdk::PartnersApi* | [**destroy_partner**](docs/PartnersApi.md#destroy_partner) | **DELETE** /api/1/partners/{id} | 取引先の削除
*UnofficialFreeeSdk::PartnersApi* | [**get_partner**](docs/PartnersApi.md#get_partner) | **GET** /api/1/partners/{id} | 取引先の取得
*UnofficialFreeeSdk::PartnersApi* | [**get_partners**](docs/PartnersApi.md#get_partners) | **GET** /api/1/partners | 取引先一覧の取得
*UnofficialFreeeSdk::PartnersApi* | [**update_partner**](docs/PartnersApi.md#update_partner) | **PUT** /api/1/partners/{id} | 取引先の更新
*UnofficialFreeeSdk::PartnersApi* | [**update_partner_by_code**](docs/PartnersApi.md#update_partner_by_code) | **PUT** /api/1/partners/code/{code} | 取引先の更新
*UnofficialFreeeSdk::PaymentsApi* | [**create_deal_payment**](docs/PaymentsApi.md#create_deal_payment) | **POST** /api/1/deals/{id}/payments | 取引（収入／支出）の支払行作成
*UnofficialFreeeSdk::PaymentsApi* | [**destroy_deal_payment**](docs/PaymentsApi.md#destroy_deal_payment) | **DELETE** /api/1/deals/{id}/payments/{payment_id} | 取引（収入／支出）の支払行削除
*UnofficialFreeeSdk::PaymentsApi* | [**update_deal_payment**](docs/PaymentsApi.md#update_deal_payment) | **PUT** /api/1/deals/{id}/payments/{payment_id} | 取引（収入／支出）の支払行更新
*UnofficialFreeeSdk::QuotationsApi* | [**create_quotation**](docs/QuotationsApi.md#create_quotation) | **POST** /api/1/quotations | 見積書の作成
*UnofficialFreeeSdk::QuotationsApi* | [**destroy_quotation**](docs/QuotationsApi.md#destroy_quotation) | **DELETE** /api/1/quotations/{id} | 見積書の削除
*UnofficialFreeeSdk::QuotationsApi* | [**get_quotation**](docs/QuotationsApi.md#get_quotation) | **GET** /api/1/quotations/{id} | 見積書の取得
*UnofficialFreeeSdk::QuotationsApi* | [**get_quotations**](docs/QuotationsApi.md#get_quotations) | **GET** /api/1/quotations | 見積書一覧の取得
*UnofficialFreeeSdk::QuotationsApi* | [**update_quotation**](docs/QuotationsApi.md#update_quotation) | **PUT** /api/1/quotations/{id} | 見積書の更新
*UnofficialFreeeSdk::ReceiptsApi* | [**create_receipt**](docs/ReceiptsApi.md#create_receipt) | **POST** /api/1/receipts | ファイルボックス 証憑ファイルアップロード
*UnofficialFreeeSdk::ReceiptsApi* | [**destroy_receipt**](docs/ReceiptsApi.md#destroy_receipt) | **DELETE** /api/1/receipts/{id} | ファイルボックス 証憑ファイルを削除する
*UnofficialFreeeSdk::ReceiptsApi* | [**get_receipt**](docs/ReceiptsApi.md#get_receipt) | **GET** /api/1/receipts/{id} | ファイルボックス 証憑ファイルの取得
*UnofficialFreeeSdk::ReceiptsApi* | [**get_receipts**](docs/ReceiptsApi.md#get_receipts) | **GET** /api/1/receipts | ファイルボックス 証憑ファイル一覧の取得
*UnofficialFreeeSdk::ReceiptsApi* | [**update_receipt**](docs/ReceiptsApi.md#update_receipt) | **PUT** /api/1/receipts/{id} | ファイルボックス 証憑ファイル情報更新
*UnofficialFreeeSdk::RenewsApi* | [**create_deal_renew**](docs/RenewsApi.md#create_deal_renew) | **POST** /api/1/deals/{id}/renews | 取引（収入／支出）に対する+更新の作成
*UnofficialFreeeSdk::RenewsApi* | [**delete_deal_renew**](docs/RenewsApi.md#delete_deal_renew) | **DELETE** /api/1/deals/{id}/renews/{renew_id} | 取引（収入／支出）の+更新の削除
*UnofficialFreeeSdk::RenewsApi* | [**update_deal_renew**](docs/RenewsApi.md#update_deal_renew) | **PUT** /api/1/deals/{id}/renews/{renew_id} | 取引（収入／支出）の+更新の更新
*UnofficialFreeeSdk::SectionsApi* | [**create_section**](docs/SectionsApi.md#create_section) | **POST** /api/1/sections | 部門の作成
*UnofficialFreeeSdk::SectionsApi* | [**destroy_section**](docs/SectionsApi.md#destroy_section) | **DELETE** /api/1/sections/{id} | 部門の削除
*UnofficialFreeeSdk::SectionsApi* | [**get_section**](docs/SectionsApi.md#get_section) | **GET** /api/1/sections/{id} | 
*UnofficialFreeeSdk::SectionsApi* | [**get_sections**](docs/SectionsApi.md#get_sections) | **GET** /api/1/sections | 部門一覧の取得
*UnofficialFreeeSdk::SectionsApi* | [**update_section**](docs/SectionsApi.md#update_section) | **PUT** /api/1/sections/{id} | 部門の更新
*UnofficialFreeeSdk::SegmentTagsApi* | [**create_segment_tag**](docs/SegmentTagsApi.md#create_segment_tag) | **POST** /api/1/segments/{segment_id}/tags | セグメントの作成
*UnofficialFreeeSdk::SegmentTagsApi* | [**destroy_segments_tag**](docs/SegmentTagsApi.md#destroy_segments_tag) | **DELETE** /api/1/segments/{segment_id}/tags/{id} | セグメントタグの削除
*UnofficialFreeeSdk::SegmentTagsApi* | [**get_segment_tags**](docs/SegmentTagsApi.md#get_segment_tags) | **GET** /api/1/segments/{segment_id}/tags | セグメントタグ一覧の取得
*UnofficialFreeeSdk::SegmentTagsApi* | [**update_segment_tag**](docs/SegmentTagsApi.md#update_segment_tag) | **PUT** /api/1/segments/{segment_id}/tags/{id} | セグメントタグの更新
*UnofficialFreeeSdk::SelectablesApi* | [**get_forms_selectables**](docs/SelectablesApi.md#get_forms_selectables) | **GET** /api/1/forms/selectables | フォーム用選択項目情報の取得
*UnofficialFreeeSdk::TagsApi* | [**create_tag**](docs/TagsApi.md#create_tag) | **POST** /api/1/tags | メモタグの作成
*UnofficialFreeeSdk::TagsApi* | [**destroy_tag**](docs/TagsApi.md#destroy_tag) | **DELETE** /api/1/tags/{id} | メモタグの削除
*UnofficialFreeeSdk::TagsApi* | [**get_tag**](docs/TagsApi.md#get_tag) | **GET** /api/1/tags/{id} | メモタグの詳細情報の取得
*UnofficialFreeeSdk::TagsApi* | [**get_tags**](docs/TagsApi.md#get_tags) | **GET** /api/1/tags | メモタグ一覧の取得
*UnofficialFreeeSdk::TagsApi* | [**update_tag**](docs/TagsApi.md#update_tag) | **PUT** /api/1/tags/{id} | メモタグの更新
*UnofficialFreeeSdk::TaxesApi* | [**get_tax_code**](docs/TaxesApi.md#get_tax_code) | **GET** /api/1/taxes/codes/{code} | 税区分コードの取得
*UnofficialFreeeSdk::TaxesApi* | [**get_tax_codes**](docs/TaxesApi.md#get_tax_codes) | **GET** /api/1/taxes/codes | 税区分コード一覧の取得
*UnofficialFreeeSdk::TaxesApi* | [**get_taxes_companies**](docs/TaxesApi.md#get_taxes_companies) | **GET** /api/1/taxes/companies/{company_id} | 税区分コード詳細一覧の取得
*UnofficialFreeeSdk::TransfersApi* | [**create_transfer**](docs/TransfersApi.md#create_transfer) | **POST** /api/1/transfers | 取引（振替）の作成
*UnofficialFreeeSdk::TransfersApi* | [**destroy_transfer**](docs/TransfersApi.md#destroy_transfer) | **DELETE** /api/1/transfers/{id} | 取引（振替）の削除する
*UnofficialFreeeSdk::TransfersApi* | [**get_transfer**](docs/TransfersApi.md#get_transfer) | **GET** /api/1/transfers/{id} | 取引（振替）の取得
*UnofficialFreeeSdk::TransfersApi* | [**get_transfers**](docs/TransfersApi.md#get_transfers) | **GET** /api/1/transfers | 取引（振替）一覧の取得
*UnofficialFreeeSdk::TransfersApi* | [**update_transfer**](docs/TransfersApi.md#update_transfer) | **PUT** /api/1/transfers/{id} | 取引（振替）の更新
*UnofficialFreeeSdk::TrialBalanceApi* | [**get_trial_bs**](docs/TrialBalanceApi.md#get_trial_bs) | **GET** /api/1/reports/trial_bs | 貸借対照表の取得
*UnofficialFreeeSdk::TrialBalanceApi* | [**get_trial_bs_three_years**](docs/TrialBalanceApi.md#get_trial_bs_three_years) | **GET** /api/1/reports/trial_bs_three_years | 貸借対照表(３期間比較)の取得
*UnofficialFreeeSdk::TrialBalanceApi* | [**get_trial_bs_two_years**](docs/TrialBalanceApi.md#get_trial_bs_two_years) | **GET** /api/1/reports/trial_bs_two_years | 貸借対照表(前年比較)の取得
*UnofficialFreeeSdk::TrialBalanceApi* | [**get_trial_pl**](docs/TrialBalanceApi.md#get_trial_pl) | **GET** /api/1/reports/trial_pl | 損益計算書の取得
*UnofficialFreeeSdk::TrialBalanceApi* | [**get_trial_pl_sections**](docs/TrialBalanceApi.md#get_trial_pl_sections) | **GET** /api/1/reports/trial_pl_sections | 損益計算書(部門比較)の取得
*UnofficialFreeeSdk::TrialBalanceApi* | [**get_trial_pl_three_years**](docs/TrialBalanceApi.md#get_trial_pl_three_years) | **GET** /api/1/reports/trial_pl_three_years | 損益計算書(３期間比較)の取得
*UnofficialFreeeSdk::TrialBalanceApi* | [**get_trial_pl_two_years**](docs/TrialBalanceApi.md#get_trial_pl_two_years) | **GET** /api/1/reports/trial_pl_two_years | 損益計算書(前年比較)の取得
*UnofficialFreeeSdk::UsersApi* | [**get_users**](docs/UsersApi.md#get_users) | **GET** /api/1/users | 事業所に所属するユーザー一覧の取得
*UnofficialFreeeSdk::UsersApi* | [**get_users_capabilities**](docs/UsersApi.md#get_users_capabilities) | **GET** /api/1/users/capabilities | ログインユーザの権限の取得
*UnofficialFreeeSdk::UsersApi* | [**get_users_me**](docs/UsersApi.md#get_users_me) | **GET** /api/1/users/me | ログインユーザ情報の取得
*UnofficialFreeeSdk::UsersApi* | [**update_user**](docs/UsersApi.md#update_user) | **PUT** /api/1/users/me | ユーザー情報の更新
*UnofficialFreeeSdk::WalletTxnsApi* | [**create_wallet_txn**](docs/WalletTxnsApi.md#create_wallet_txn) | **POST** /api/1/wallet_txns | 明細の作成
*UnofficialFreeeSdk::WalletTxnsApi* | [**destroy_wallet_txn**](docs/WalletTxnsApi.md#destroy_wallet_txn) | **DELETE** /api/1/wallet_txns/{id} | 明細の削除
*UnofficialFreeeSdk::WalletTxnsApi* | [**get_wallet_txn**](docs/WalletTxnsApi.md#get_wallet_txn) | **GET** /api/1/wallet_txns/{id} | 明細の取得
*UnofficialFreeeSdk::WalletTxnsApi* | [**get_wallet_txns**](docs/WalletTxnsApi.md#get_wallet_txns) | **GET** /api/1/wallet_txns | 明細一覧の取得
*UnofficialFreeeSdk::WalletablesApi* | [**create_walletable**](docs/WalletablesApi.md#create_walletable) | **POST** /api/1/walletables | 口座の作成
*UnofficialFreeeSdk::WalletablesApi* | [**destroy_walletable**](docs/WalletablesApi.md#destroy_walletable) | **DELETE** /api/1/walletables/{type}/{id} | 口座の削除
*UnofficialFreeeSdk::WalletablesApi* | [**get_walletable**](docs/WalletablesApi.md#get_walletable) | **GET** /api/1/walletables/{type}/{id} | 口座情報の取得
*UnofficialFreeeSdk::WalletablesApi* | [**get_walletables**](docs/WalletablesApi.md#get_walletables) | **GET** /api/1/walletables | 口座一覧の取得
*UnofficialFreeeSdk::WalletablesApi* | [**update_walletable**](docs/WalletablesApi.md#update_walletable) | **PUT** /api/1/walletables/{type}/{id} | 口座の更新


## Documentation for Models

 - [UnofficialFreeeSdk::AccountItemParams](docs/AccountItemParams.md)
 - [UnofficialFreeeSdk::AccountItemParamsAccountItem](docs/AccountItemParamsAccountItem.md)
 - [UnofficialFreeeSdk::AccountItemParamsAccountItemItems](docs/AccountItemParamsAccountItemItems.md)
 - [UnofficialFreeeSdk::AccountItemResponse](docs/AccountItemResponse.md)
 - [UnofficialFreeeSdk::AccountItemResponseAccountItem](docs/AccountItemResponseAccountItem.md)
 - [UnofficialFreeeSdk::AccountItemResponseAccountItemItems](docs/AccountItemResponseAccountItemItems.md)
 - [UnofficialFreeeSdk::AccountItemResponseAccountItemPartners](docs/AccountItemResponseAccountItemPartners.md)
 - [UnofficialFreeeSdk::AccountItemsResponse](docs/AccountItemsResponse.md)
 - [UnofficialFreeeSdk::AccountItemsResponseAccountItems](docs/AccountItemsResponseAccountItems.md)
 - [UnofficialFreeeSdk::ApprovalRequestParams](docs/ApprovalRequestParams.md)
 - [UnofficialFreeeSdk::ApprovalRequestParamsRequestItems](docs/ApprovalRequestParamsRequestItems.md)
 - [UnofficialFreeeSdk::ApprovalRequestResponse](docs/ApprovalRequestResponse.md)
 - [UnofficialFreeeSdk::ApprovalRequestResponseApprovalRequest](docs/ApprovalRequestResponseApprovalRequest.md)
 - [UnofficialFreeeSdk::ApprovalRequestResponseApprovalRequestRequestItems](docs/ApprovalRequestResponseApprovalRequestRequestItems.md)
 - [UnofficialFreeeSdk::BadRequestError](docs/BadRequestError.md)
 - [UnofficialFreeeSdk::BadRequestErrorErrors](docs/BadRequestErrorErrors.md)
 - [UnofficialFreeeSdk::BadRequestNotFoundError](docs/BadRequestNotFoundError.md)
 - [UnofficialFreeeSdk::BadRequestNotFoundErrorErrors](docs/BadRequestNotFoundErrorErrors.md)
 - [UnofficialFreeeSdk::BankResponse](docs/BankResponse.md)
 - [UnofficialFreeeSdk::BankResponseBank](docs/BankResponseBank.md)
 - [UnofficialFreeeSdk::CompanyIndexResponse](docs/CompanyIndexResponse.md)
 - [UnofficialFreeeSdk::CompanyIndexResponseCompanies](docs/CompanyIndexResponseCompanies.md)
 - [UnofficialFreeeSdk::CompanyParams](docs/CompanyParams.md)
 - [UnofficialFreeeSdk::CompanyParamsAddressAttributes](docs/CompanyParamsAddressAttributes.md)
 - [UnofficialFreeeSdk::CompanyParamsDocTemplate](docs/CompanyParamsDocTemplate.md)
 - [UnofficialFreeeSdk::CompanyParamsFiscalYearsAttributes](docs/CompanyParamsFiscalYearsAttributes.md)
 - [UnofficialFreeeSdk::CompanyParamsSalesInformationAttributes](docs/CompanyParamsSalesInformationAttributes.md)
 - [UnofficialFreeeSdk::CompanyResponse](docs/CompanyResponse.md)
 - [UnofficialFreeeSdk::CompanyResponseCompany](docs/CompanyResponseCompany.md)
 - [UnofficialFreeeSdk::CompanyUpdateResponse](docs/CompanyUpdateResponse.md)
 - [UnofficialFreeeSdk::CompanyUpdateResponseCompany](docs/CompanyUpdateResponseCompany.md)
 - [UnofficialFreeeSdk::CompanyUpdateResponseCompanyFiscalYears](docs/CompanyUpdateResponseCompanyFiscalYears.md)
 - [UnofficialFreeeSdk::DealCreateParams](docs/DealCreateParams.md)
 - [UnofficialFreeeSdk::DealCreateParamsDetails](docs/DealCreateParamsDetails.md)
 - [UnofficialFreeeSdk::DealCreateParamsPayments](docs/DealCreateParamsPayments.md)
 - [UnofficialFreeeSdk::DealCreateResponse](docs/DealCreateResponse.md)
 - [UnofficialFreeeSdk::DealCreateResponseDeal](docs/DealCreateResponseDeal.md)
 - [UnofficialFreeeSdk::DealCreateResponseDealDetails](docs/DealCreateResponseDealDetails.md)
 - [UnofficialFreeeSdk::DealCreateResponseDealPayments](docs/DealCreateResponseDealPayments.md)
 - [UnofficialFreeeSdk::DealResponse](docs/DealResponse.md)
 - [UnofficialFreeeSdk::DealResponseDeal](docs/DealResponseDeal.md)
 - [UnofficialFreeeSdk::DealResponseDealDetails](docs/DealResponseDealDetails.md)
 - [UnofficialFreeeSdk::DealResponseDealReceipts](docs/DealResponseDealReceipts.md)
 - [UnofficialFreeeSdk::DealResponseDealRenews](docs/DealResponseDealRenews.md)
 - [UnofficialFreeeSdk::DealResponseDealUser](docs/DealResponseDealUser.md)
 - [UnofficialFreeeSdk::DealUpdateParams](docs/DealUpdateParams.md)
 - [UnofficialFreeeSdk::DealUpdateParamsDetails](docs/DealUpdateParamsDetails.md)
 - [UnofficialFreeeSdk::ExpenseApplicationCreateParams](docs/ExpenseApplicationCreateParams.md)
 - [UnofficialFreeeSdk::ExpenseApplicationCreateParamsExpenseApplicationLines](docs/ExpenseApplicationCreateParamsExpenseApplicationLines.md)
 - [UnofficialFreeeSdk::ExpenseApplicationLineTemplateParams](docs/ExpenseApplicationLineTemplateParams.md)
 - [UnofficialFreeeSdk::ExpenseApplicationLineTemplateResponse](docs/ExpenseApplicationLineTemplateResponse.md)
 - [UnofficialFreeeSdk::ExpenseApplicationLineTemplateResponseExpenseApplicationLineTemplate](docs/ExpenseApplicationLineTemplateResponseExpenseApplicationLineTemplate.md)
 - [UnofficialFreeeSdk::ExpenseApplicationResponse](docs/ExpenseApplicationResponse.md)
 - [UnofficialFreeeSdk::ExpenseApplicationResponseExpenseApplication](docs/ExpenseApplicationResponseExpenseApplication.md)
 - [UnofficialFreeeSdk::ExpenseApplicationResponseExpenseApplicationExpenseApplicationLines](docs/ExpenseApplicationResponseExpenseApplicationExpenseApplicationLines.md)
 - [UnofficialFreeeSdk::ExpenseApplicationUpdateParams](docs/ExpenseApplicationUpdateParams.md)
 - [UnofficialFreeeSdk::ExpenseApplicationUpdateParamsExpenseApplicationLines](docs/ExpenseApplicationUpdateParamsExpenseApplicationLines.md)
 - [UnofficialFreeeSdk::FiscalYears](docs/FiscalYears.md)
 - [UnofficialFreeeSdk::ForbiddenError](docs/ForbiddenError.md)
 - [UnofficialFreeeSdk::InlineResponse200](docs/InlineResponse200.md)
 - [UnofficialFreeeSdk::InlineResponse2001](docs/InlineResponse2001.md)
 - [UnofficialFreeeSdk::InlineResponse20010](docs/InlineResponse20010.md)
 - [UnofficialFreeeSdk::InlineResponse20011](docs/InlineResponse20011.md)
 - [UnofficialFreeeSdk::InlineResponse20011Taxes](docs/InlineResponse20011Taxes.md)
 - [UnofficialFreeeSdk::InlineResponse20012](docs/InlineResponse20012.md)
 - [UnofficialFreeeSdk::InlineResponse20012Meta](docs/InlineResponse20012Meta.md)
 - [UnofficialFreeeSdk::InlineResponse20013](docs/InlineResponse20013.md)
 - [UnofficialFreeeSdk::InlineResponse20014](docs/InlineResponse20014.md)
 - [UnofficialFreeeSdk::InlineResponse20015](docs/InlineResponse20015.md)
 - [UnofficialFreeeSdk::InlineResponse20016](docs/InlineResponse20016.md)
 - [UnofficialFreeeSdk::InlineResponse20017](docs/InlineResponse20017.md)
 - [UnofficialFreeeSdk::InlineResponse20018](docs/InlineResponse20018.md)
 - [UnofficialFreeeSdk::InlineResponse20019](docs/InlineResponse20019.md)
 - [UnofficialFreeeSdk::InlineResponse2002](docs/InlineResponse2002.md)
 - [UnofficialFreeeSdk::InlineResponse2003](docs/InlineResponse2003.md)
 - [UnofficialFreeeSdk::InlineResponse2004](docs/InlineResponse2004.md)
 - [UnofficialFreeeSdk::InlineResponse2005](docs/InlineResponse2005.md)
 - [UnofficialFreeeSdk::InlineResponse2005Meta](docs/InlineResponse2005Meta.md)
 - [UnofficialFreeeSdk::InlineResponse2006](docs/InlineResponse2006.md)
 - [UnofficialFreeeSdk::InlineResponse2007](docs/InlineResponse2007.md)
 - [UnofficialFreeeSdk::InlineResponse2008](docs/InlineResponse2008.md)
 - [UnofficialFreeeSdk::InlineResponse2009](docs/InlineResponse2009.md)
 - [UnofficialFreeeSdk::InternalServerError](docs/InternalServerError.md)
 - [UnofficialFreeeSdk::InternalServerErrorErrors](docs/InternalServerErrorErrors.md)
 - [UnofficialFreeeSdk::InvoiceCreateParams](docs/InvoiceCreateParams.md)
 - [UnofficialFreeeSdk::InvoiceCreateParamsInvoiceContents](docs/InvoiceCreateParamsInvoiceContents.md)
 - [UnofficialFreeeSdk::InvoiceResponse](docs/InvoiceResponse.md)
 - [UnofficialFreeeSdk::InvoiceResponseInvoice](docs/InvoiceResponseInvoice.md)
 - [UnofficialFreeeSdk::InvoiceResponseInvoiceInvoiceContents](docs/InvoiceResponseInvoiceInvoiceContents.md)
 - [UnofficialFreeeSdk::InvoiceResponseInvoiceTotalAmountPerVatRate](docs/InvoiceResponseInvoiceTotalAmountPerVatRate.md)
 - [UnofficialFreeeSdk::InvoiceUpdateParams](docs/InvoiceUpdateParams.md)
 - [UnofficialFreeeSdk::InvoiceUpdateParamsInvoiceContents](docs/InvoiceUpdateParamsInvoiceContents.md)
 - [UnofficialFreeeSdk::ItemParams](docs/ItemParams.md)
 - [UnofficialFreeeSdk::ItemResponse](docs/ItemResponse.md)
 - [UnofficialFreeeSdk::ItemResponseItem](docs/ItemResponseItem.md)
 - [UnofficialFreeeSdk::JournalStatusResponse](docs/JournalStatusResponse.md)
 - [UnofficialFreeeSdk::JournalStatusResponseJournals](docs/JournalStatusResponseJournals.md)
 - [UnofficialFreeeSdk::JournalsResponse](docs/JournalsResponse.md)
 - [UnofficialFreeeSdk::JournalsResponseJournals](docs/JournalsResponseJournals.md)
 - [UnofficialFreeeSdk::ManualJournalCreateParams](docs/ManualJournalCreateParams.md)
 - [UnofficialFreeeSdk::ManualJournalCreateParamsDetails](docs/ManualJournalCreateParamsDetails.md)
 - [UnofficialFreeeSdk::ManualJournalResponse](docs/ManualJournalResponse.md)
 - [UnofficialFreeeSdk::ManualJournalResponseManualJournal](docs/ManualJournalResponseManualJournal.md)
 - [UnofficialFreeeSdk::ManualJournalResponseManualJournalDetails](docs/ManualJournalResponseManualJournalDetails.md)
 - [UnofficialFreeeSdk::ManualJournalUpdateParams](docs/ManualJournalUpdateParams.md)
 - [UnofficialFreeeSdk::ManualJournalUpdateParamsDetails](docs/ManualJournalUpdateParamsDetails.md)
 - [UnofficialFreeeSdk::MeResponse](docs/MeResponse.md)
 - [UnofficialFreeeSdk::MeResponseUser](docs/MeResponseUser.md)
 - [UnofficialFreeeSdk::MeResponseUserCompanies](docs/MeResponseUserCompanies.md)
 - [UnofficialFreeeSdk::PartnerCreateParams](docs/PartnerCreateParams.md)
 - [UnofficialFreeeSdk::PartnerCreateParamsAddressAttributes](docs/PartnerCreateParamsAddressAttributes.md)
 - [UnofficialFreeeSdk::PartnerCreateParamsPartnerBankAccountAttributes](docs/PartnerCreateParamsPartnerBankAccountAttributes.md)
 - [UnofficialFreeeSdk::PartnerCreateParamsPartnerDocSettingAttributes](docs/PartnerCreateParamsPartnerDocSettingAttributes.md)
 - [UnofficialFreeeSdk::PartnerResponse](docs/PartnerResponse.md)
 - [UnofficialFreeeSdk::PartnerUpdateParams](docs/PartnerUpdateParams.md)
 - [UnofficialFreeeSdk::PaymentParams](docs/PaymentParams.md)
 - [UnofficialFreeeSdk::QuotationCreateParams](docs/QuotationCreateParams.md)
 - [UnofficialFreeeSdk::QuotationResponse](docs/QuotationResponse.md)
 - [UnofficialFreeeSdk::QuotationResponseQuotation](docs/QuotationResponseQuotation.md)
 - [UnofficialFreeeSdk::QuotationResponseQuotationQuotationContents](docs/QuotationResponseQuotationQuotationContents.md)
 - [UnofficialFreeeSdk::QuotationUpdateParams](docs/QuotationUpdateParams.md)
 - [UnofficialFreeeSdk::QuotationUpdateParamsQuotationContents](docs/QuotationUpdateParamsQuotationContents.md)
 - [UnofficialFreeeSdk::ReceiptCreateParams](docs/ReceiptCreateParams.md)
 - [UnofficialFreeeSdk::ReceiptResponse](docs/ReceiptResponse.md)
 - [UnofficialFreeeSdk::ReceiptUpdateParams](docs/ReceiptUpdateParams.md)
 - [UnofficialFreeeSdk::RenewCreateParams](docs/RenewCreateParams.md)
 - [UnofficialFreeeSdk::RenewCreateParamsDetails](docs/RenewCreateParamsDetails.md)
 - [UnofficialFreeeSdk::RenewUpdateParams](docs/RenewUpdateParams.md)
 - [UnofficialFreeeSdk::RenewUpdateParamsDetails](docs/RenewUpdateParamsDetails.md)
 - [UnofficialFreeeSdk::SectionParams](docs/SectionParams.md)
 - [UnofficialFreeeSdk::SectionResponse](docs/SectionResponse.md)
 - [UnofficialFreeeSdk::SectionResponseSection](docs/SectionResponseSection.md)
 - [UnofficialFreeeSdk::SegmentTagParams](docs/SegmentTagParams.md)
 - [UnofficialFreeeSdk::SegmentTagResponse](docs/SegmentTagResponse.md)
 - [UnofficialFreeeSdk::SegmentTagResponseSegmentTag](docs/SegmentTagResponseSegmentTag.md)
 - [UnofficialFreeeSdk::SelectablesIndexResponse](docs/SelectablesIndexResponse.md)
 - [UnofficialFreeeSdk::SelectablesIndexResponseAccountCategories](docs/SelectablesIndexResponseAccountCategories.md)
 - [UnofficialFreeeSdk::SelectablesIndexResponseAccountGroups](docs/SelectablesIndexResponseAccountGroups.md)
 - [UnofficialFreeeSdk::SelectablesIndexResponseAccountItems](docs/SelectablesIndexResponseAccountItems.md)
 - [UnofficialFreeeSdk::SelectablesIndexResponseDefaultTax](docs/SelectablesIndexResponseDefaultTax.md)
 - [UnofficialFreeeSdk::SelectablesIndexResponseDefaultTaxTaxRate5](docs/SelectablesIndexResponseDefaultTaxTaxRate5.md)
 - [UnofficialFreeeSdk::SelectablesIndexResponseDefaultTaxTaxRate8](docs/SelectablesIndexResponseDefaultTaxTaxRate8.md)
 - [UnofficialFreeeSdk::ServiceUnavailableError](docs/ServiceUnavailableError.md)
 - [UnofficialFreeeSdk::ServiceUnavailableErrorErrors](docs/ServiceUnavailableErrorErrors.md)
 - [UnofficialFreeeSdk::TagParams](docs/TagParams.md)
 - [UnofficialFreeeSdk::TagResponse](docs/TagResponse.md)
 - [UnofficialFreeeSdk::TagResponseTag](docs/TagResponseTag.md)
 - [UnofficialFreeeSdk::TaxResponse](docs/TaxResponse.md)
 - [UnofficialFreeeSdk::TaxResponseTax](docs/TaxResponseTax.md)
 - [UnofficialFreeeSdk::TooManyRequestsError](docs/TooManyRequestsError.md)
 - [UnofficialFreeeSdk::TooManyRequestsErrorMeta](docs/TooManyRequestsErrorMeta.md)
 - [UnofficialFreeeSdk::TransferParams](docs/TransferParams.md)
 - [UnofficialFreeeSdk::TransferResponse](docs/TransferResponse.md)
 - [UnofficialFreeeSdk::TransferResponseTransfer](docs/TransferResponseTransfer.md)
 - [UnofficialFreeeSdk::TrialBsResponse](docs/TrialBsResponse.md)
 - [UnofficialFreeeSdk::TrialBsResponseTrialBs](docs/TrialBsResponseTrialBs.md)
 - [UnofficialFreeeSdk::TrialBsResponseTrialBsBalances](docs/TrialBsResponseTrialBsBalances.md)
 - [UnofficialFreeeSdk::TrialBsResponseTrialBsItems](docs/TrialBsResponseTrialBsItems.md)
 - [UnofficialFreeeSdk::TrialBsResponseTrialBsPartners](docs/TrialBsResponseTrialBsPartners.md)
 - [UnofficialFreeeSdk::TrialBsThreeYearsResponse](docs/TrialBsThreeYearsResponse.md)
 - [UnofficialFreeeSdk::TrialBsThreeYearsResponseTrialBsThreeYears](docs/TrialBsThreeYearsResponseTrialBsThreeYears.md)
 - [UnofficialFreeeSdk::TrialBsThreeYearsResponseTrialBsThreeYearsBalances](docs/TrialBsThreeYearsResponseTrialBsThreeYearsBalances.md)
 - [UnofficialFreeeSdk::TrialBsThreeYearsResponseTrialBsThreeYearsItems](docs/TrialBsThreeYearsResponseTrialBsThreeYearsItems.md)
 - [UnofficialFreeeSdk::TrialBsThreeYearsResponseTrialBsThreeYearsPartners](docs/TrialBsThreeYearsResponseTrialBsThreeYearsPartners.md)
 - [UnofficialFreeeSdk::TrialBsTwoYearsResponse](docs/TrialBsTwoYearsResponse.md)
 - [UnofficialFreeeSdk::TrialBsTwoYearsResponseTrialBsTwoYears](docs/TrialBsTwoYearsResponseTrialBsTwoYears.md)
 - [UnofficialFreeeSdk::TrialBsTwoYearsResponseTrialBsTwoYearsBalances](docs/TrialBsTwoYearsResponseTrialBsTwoYearsBalances.md)
 - [UnofficialFreeeSdk::TrialBsTwoYearsResponseTrialBsTwoYearsItems](docs/TrialBsTwoYearsResponseTrialBsTwoYearsItems.md)
 - [UnofficialFreeeSdk::TrialBsTwoYearsResponseTrialBsTwoYearsPartners](docs/TrialBsTwoYearsResponseTrialBsTwoYearsPartners.md)
 - [UnofficialFreeeSdk::TrialPlResponse](docs/TrialPlResponse.md)
 - [UnofficialFreeeSdk::TrialPlResponseTrialPl](docs/TrialPlResponseTrialPl.md)
 - [UnofficialFreeeSdk::TrialPlResponseTrialPlBalances](docs/TrialPlResponseTrialPlBalances.md)
 - [UnofficialFreeeSdk::TrialPlResponseTrialPlSections](docs/TrialPlResponseTrialPlSections.md)
 - [UnofficialFreeeSdk::TrialPlSectionsResponse](docs/TrialPlSectionsResponse.md)
 - [UnofficialFreeeSdk::TrialPlSectionsResponseTrialPlSections](docs/TrialPlSectionsResponseTrialPlSections.md)
 - [UnofficialFreeeSdk::TrialPlSectionsResponseTrialPlSectionsBalances](docs/TrialPlSectionsResponseTrialPlSectionsBalances.md)
 - [UnofficialFreeeSdk::TrialPlSectionsResponseTrialPlSectionsItems](docs/TrialPlSectionsResponseTrialPlSectionsItems.md)
 - [UnofficialFreeeSdk::TrialPlSectionsResponseTrialPlSectionsPartners](docs/TrialPlSectionsResponseTrialPlSectionsPartners.md)
 - [UnofficialFreeeSdk::TrialPlSectionsResponseTrialPlSectionsSections](docs/TrialPlSectionsResponseTrialPlSectionsSections.md)
 - [UnofficialFreeeSdk::TrialPlThreeYearsResponse](docs/TrialPlThreeYearsResponse.md)
 - [UnofficialFreeeSdk::TrialPlThreeYearsResponseTrialPlThreeYears](docs/TrialPlThreeYearsResponseTrialPlThreeYears.md)
 - [UnofficialFreeeSdk::TrialPlThreeYearsResponseTrialPlThreeYearsBalances](docs/TrialPlThreeYearsResponseTrialPlThreeYearsBalances.md)
 - [UnofficialFreeeSdk::TrialPlThreeYearsResponseTrialPlThreeYearsSections](docs/TrialPlThreeYearsResponseTrialPlThreeYearsSections.md)
 - [UnofficialFreeeSdk::TrialPlTwoYearsResponse](docs/TrialPlTwoYearsResponse.md)
 - [UnofficialFreeeSdk::TrialPlTwoYearsResponseTrialPlTwoYears](docs/TrialPlTwoYearsResponseTrialPlTwoYears.md)
 - [UnofficialFreeeSdk::TrialPlTwoYearsResponseTrialPlTwoYearsBalances](docs/TrialPlTwoYearsResponseTrialPlTwoYearsBalances.md)
 - [UnofficialFreeeSdk::TrialPlTwoYearsResponseTrialPlTwoYearsSections](docs/TrialPlTwoYearsResponseTrialPlTwoYearsSections.md)
 - [UnofficialFreeeSdk::UnauthorizedError](docs/UnauthorizedError.md)
 - [UnofficialFreeeSdk::UserCapability](docs/UserCapability.md)
 - [UnofficialFreeeSdk::UserParams](docs/UserParams.md)
 - [UnofficialFreeeSdk::UserResponse](docs/UserResponse.md)
 - [UnofficialFreeeSdk::UserResponseUser](docs/UserResponseUser.md)
 - [UnofficialFreeeSdk::WalletTxnParams](docs/WalletTxnParams.md)
 - [UnofficialFreeeSdk::WalletTxnResponse](docs/WalletTxnResponse.md)
 - [UnofficialFreeeSdk::WalletTxnResponseWalletTxn](docs/WalletTxnResponseWalletTxn.md)
 - [UnofficialFreeeSdk::WalletableCreateParams](docs/WalletableCreateParams.md)
 - [UnofficialFreeeSdk::WalletableCreateResponse](docs/WalletableCreateResponse.md)
 - [UnofficialFreeeSdk::WalletableResponse](docs/WalletableResponse.md)
 - [UnofficialFreeeSdk::WalletableResponseWalletable](docs/WalletableResponseWalletable.md)
 - [UnofficialFreeeSdk::WalletableUpdateParams](docs/WalletableUpdateParams.md)


## Documentation for Authorization


### oauth2


- **Type**: OAuth
- **Flow**: accessCode
- **Authorization URL**: https://accounts.secure.freee.co.jp/public_api/authorize
- **Scopes**: 
  - write: データの書き込み
  - read: データの読み取り

