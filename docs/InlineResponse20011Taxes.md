# UnofficialFreeeSdk::InlineResponse20011Taxes

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**code** | **Integer** | 税区分コード | 
**name** | **String** | 税区分名 | 
**name_ja** | **String** | 税区分名（日本語表示用） | 
**display_category** | **String** | 税区分の表示カテゴリ（tax_5: 5%表示の税区分、tax_8: 8%表示の税区分、tax_r8: 軽減税率8%表示の税区分、tax_10: 10%表示の税区分、null: 税率未設定税区分） | 
**available** | **Boolean** | true: 使用する、false: 使用しない | 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::InlineResponse20011Taxes.new(code: 21,
                                 name: sales_with_tax,
                                 name_ja: 課税売上,
                                 display_category: tax_8,
                                 available: true)
```


