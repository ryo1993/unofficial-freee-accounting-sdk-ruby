# UnofficialFreeeSdk::TrialBsThreeYearsResponseTrialBsThreeYears

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**company_id** | **Integer** | 事業所ID | 
**up_to_date** | **Boolean** | 集計結果が最新かどうか | 
**fiscal_year** | **Integer** | 会計年度(条件に指定した時、または条件に月、日条件がない時のみ含まれる） | [optional] 
**start_month** | **Integer** | 発生月で絞込：開始会計月(mm)(条件に指定した時のみ含まれる） | [optional] 
**end_month** | **Integer** | 発生月で絞込：終了会計月(mm)(条件に指定した時のみ含まれる） | [optional] 
**start_date** | **String** | 発生日で絞込：開始日(yyyy-mm-dd)(条件に指定した時のみ含まれる） | [optional] 
**end_date** | **String** | 発生日で絞込：終了日(yyyy-mm-dd)(条件に指定した時のみ含まれる） | [optional] 
**account_item_display_type** | **String** | 勘定科目の表示（勘定科目: account_item, 決算書表示:group）(条件に指定した時のみ含まれる） | [optional] 
**breakdown_display_type** | **String** | 内訳の表示（取引先: partner, 品目: item, 勘定科目: account_item）(条件に指定した時のみ含まれる） | [optional] 
**partner_id** | **Integer** | 取引先ID(条件に指定した時のみ含まれる） | [optional] 
**partner_code** | **String** | 取引先コード(条件に指定した時のみ含まれる） | [optional] 
**item_id** | **Integer** | 品目ID(条件に指定した時のみ含まれる） | [optional] 
**adjustment** | **String** | 決算整理仕訳のみ: only, 決算整理仕訳以外: without(条件に指定した時のみ含まれる） | [optional] 
**created_at** | **String** | 作成日時 | [optional] 
**balances** | [**Array&lt;TrialBsThreeYearsResponseTrialBsThreeYearsBalances&gt;**](TrialBsThreeYearsResponseTrialBsThreeYearsBalances.md) |  | 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::TrialBsThreeYearsResponseTrialBsThreeYears.new(company_id: 1,
                                 up_to_date: true,
                                 fiscal_year: 2019,
                                 start_month: 1,
                                 end_month: 12,
                                 start_date: 2019-01-01,
                                 end_date: 2019-12-31,
                                 account_item_display_type: null,
                                 breakdown_display_type: null,
                                 partner_id: 1,
                                 partner_code: code001,
                                 item_id: 1,
                                 adjustment: only,
                                 created_at: 2018-09-10T13:47:24.000+09:00,
                                 balances: null)
```


