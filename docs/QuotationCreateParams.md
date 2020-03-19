# UnofficialFreeeSdk::QuotationCreateParams

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**company_id** | **Integer** | 事業所ID | 
**issue_date** | **String** | 見積日 (yyyy-mm-dd) | [optional] 
**partner_id** | **Integer** | 取引先ID | [optional] 
**partner_code** | **String** | 取引先コード | [optional] 
**quotation_number** | **String** | 見積書番号 (デフォルト: 自動採番されます) | [optional] 
**title** | **String** | タイトル (デフォルト: 見積書) | [optional] 
**description** | **String** | 概要 | [optional] 
**quotation_status** | **String** | 見積書ステータス  (unsubmitted: 送付待ち, submitted: 送付済み) | [optional] 
**partner_display_name** | **String** | 見積書に表示する取引先名 | 
**partner_title** | **String** | 敬称（御中、様、(空白)の3つから選択） | 
**partner_contact_info** | **String** | 取引先担当者名 | [optional] 
**partner_zipcode** | **String** | 取引先郵便番号 (デフォルトはpartner_idもしくははpartner_codeで指定された取引先設定情報が補完されます) | [optional] 
**partner_prefecture_code** | **Integer** | 取引先都道府県コード（0:北海道、1:青森、2:岩手、3:宮城、4:秋田、5:山形、6:福島、7:茨城、8:栃木、9:群馬、10:埼玉、11:千葉、12:東京、13:神奈川、14:新潟、15:富山、16:石川、17:福井、18:山梨、19:長野、20:岐阜、21:静岡、22:愛知、23:三重、24:滋賀、25:京都、26:大阪、27:兵庫、28:奈良、29:和歌山、30:鳥取、31:島根、32:岡山、33:広島、34:山口、35:徳島、36:香川、37:愛媛、38:高知、39:福岡、40:佐賀、41:長崎、42:熊本、43:大分、44:宮崎、45:鹿児島、46:沖縄) (デフォルトはpartner_idもしくはpartner_codeで指定された取引先設定情報が補完されます) | [optional] 
**partner_address1** | **String** | 取引先市区町村・番地 (デフォルトはpartner_idもしくははpartner_codeで指定された取引先設定情報が補完されます) | [optional] 
**partner_address2** | **String** | 取引先建物名・部屋番号など (デフォルトはpartner_idもしくははpartner_codeで指定された取引先設定情報が補完されます) | [optional] 
**company_name** | **String** | 事業所名 (デフォルトは事業所設定情報が補完されます) | [optional] 
**company_zipcode** | **String** | 郵便番号 (デフォルトは事業所設定情報が補完されます) | [optional] 
**company_prefecture_code** | **Integer** | 都道府県コード（0:北海道、1:青森、2:岩手、3:宮城、4:秋田、5:山形、6:福島、7:茨城、8:栃木、9:群馬、10:埼玉、11:千葉、12:東京、13:神奈川、14:新潟、15:富山、16:石川、17:福井、18:山梨、19:長野、20:岐阜、21:静岡、22:愛知、23:三重、24:滋賀、25:京都、26:大阪、27:兵庫、28:奈良、29:和歌山、30:鳥取、31:島根、32:岡山、33:広島、34:山口、35:徳島、36:香川、37:愛媛、38:高知、39:福岡、40:佐賀、41:長崎、42:熊本、43:大分、44:宮崎、45:鹿児島、46:沖縄) (デフォルトは事業所設定情報が補完されます) | [optional] 
**company_address1** | **String** | 市区町村・番地 (デフォルトは事業所設定情報が補完されます) | [optional] 
**company_address2** | **String** | 建物名・部屋番号など (デフォルトは事業所設定情報が補完されます) | [optional] 
**company_contact_info** | **String** | 事業所担当者名 (デフォルトは事業所設定情報が補完されます) | [optional] 
**message** | **String** | メッセージ (デフォルト: 下記の通り御見積申し上げます。) | [optional] 
**notes** | **String** | 備考 | [optional] 
**quotation_layout** | **String** | レイアウト(default_classic: レイアウト１/クラシック (デフォルト), standard_classic: レイアウト２/クラシック, envelope_classic: 封筒１/クラシック, default_modern: レイアウト１/モダン, standard_modern: レイアウト２/モダン, envelope_modern: 封筒/モダン) | [optional] 
**tax_entry_method** | **String** | 見積書の消費税計算方法(inclusive: 内税表示, exclusive: 外税表示 (デフォルト)) | [optional] 
**quotation_contents** | [**Array&lt;InvoiceCreateParamsInvoiceContents&gt;**](InvoiceCreateParamsInvoiceContents.md) | 見積内容 | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::QuotationCreateParams.new(company_id: 1,
                                 issue_date: 2013-01-01,
                                 partner_id: 201,
                                 partner_code: code001,
                                 quotation_number: A001,
                                 title: 見積書,
                                 description: ８月分見積書,
                                 quotation_status: null,
                                 partner_display_name: freeeパートナー株式会社,
                                 partner_title: 御中,
                                 partner_contact_info: 営業担当,
                                 partner_zipcode: 012-0009,
                                 partner_prefecture_code: 4,
                                 partner_address1: 湯沢市,
                                 partner_address2: Aビル,
                                 company_name: freee株式会社,
                                 company_zipcode: 000-0000,
                                 company_prefecture_code: 12,
                                 company_address1: ＸＸ区ＹＹ１−１−１,
                                 company_address2: ビル1F,
                                 company_contact_info: 法人営業担当,
                                 message: 下記の通り御見積申し上げます。,
                                 notes: 毎度ありがとうございます,
                                 quotation_layout: default_classic,
                                 tax_entry_method: exclusive,
                                 quotation_contents: null)
```


