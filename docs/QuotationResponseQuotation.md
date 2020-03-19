# UnofficialFreeeSdk::QuotationResponseQuotation

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 見積書ID | 
**company_id** | **Integer** | 事業所ID | 
**issue_date** | **String** | 見積日 (yyyy-mm-dd) | 
**partner_id** | **Integer** | 取引先ID | 
**partner_code** | **String** | 取引先コード | [optional] 
**quotation_number** | **String** | 見積書番号 | 
**title** | **String** | タイトル | [optional] 
**total_amount** | **Integer** | 合計金額 | 
**total_vat** | **Integer** | 消費税 | [optional] 
**sub_total** | **Integer** | 小計 | [optional] 
**description** | **String** | 概要 | [optional] 
**quotation_status** | **String** | 見積書ステータス  (unsubmitted: 送付待ち, submitted: 送付済み, all: 全て) | 
**web_published_at** | **String** | Web共有日時(最新) | [optional] 
**web_downloaded_at** | **String** | Web共有ダウンロード日時(最新) | [optional] 
**web_confirmed_at** | **String** | Web共有取引先確認日時(最新) | [optional] 
**mail_sent_at** | **String** | メール送信日時(最新) | [optional] 
**partner_name** | **String** | 取引先名 | [optional] 
**partner_display_name** | **String** | 取引先正式名称 | [optional] 
**partner_title** | **String** | 敬称（御中、様、(空白)の3つから選択） | 
**partner_zipcode** | **String** | 郵便番号 | [optional] 
**partner_prefecture_code** | **Integer** | 都道府県コード（0:北海道、1:青森、2:岩手、3:宮城、4:秋田、5:山形、6:福島、7:茨城、8:栃木、9:群馬、10:埼玉、11:千葉、12:東京、13:神奈川、14:新潟、15:富山、16:石川、17:福井、18:山梨、19:長野、20:岐阜、21:静岡、22:愛知、23:三重、24:滋賀、25:京都、26:大阪、27:兵庫、28:奈良、29:和歌山、30:鳥取、31:島根、32:岡山、33:広島、34:山口、35:徳島、36:香川、37:愛媛、38:高知、39:福岡、40:佐賀、41:長崎、42:熊本、43:大分、44:宮崎、45:鹿児島、46:沖縄 | [optional] 
**partner_prefecture_name** | **String** | 都道府県 | [optional] 
**partner_address1** | **String** | 市区町村・番地 | [optional] 
**partner_address2** | **String** | 建物名・部屋番号など | [optional] 
**partner_contact_info** | **String** | 取引先担当者名 | [optional] 
**company_name** | **String** | 事業所名 | 
**company_zipcode** | **String** | 郵便番号 | [optional] 
**company_prefecture_code** | **Integer** | 都道府県コード（0:北海道、1:青森、2:岩手、3:宮城、4:秋田、5:山形、6:福島、7:茨城、8:栃木、9:群馬、10:埼玉、11:千葉、12:東京、13:神奈川、14:新潟、15:富山、16:石川、17:福井、18:山梨、19:長野、20:岐阜、21:静岡、22:愛知、23:三重、24:滋賀、25:京都、26:大阪、27:兵庫、28:奈良、29:和歌山、30:鳥取、31:島根、32:岡山、33:広島、34:山口、35:徳島、36:香川、37:愛媛、38:高知、39:福岡、40:佐賀、41:長崎、42:熊本、43:大分、44:宮崎、45:鹿児島、46:沖縄 | [optional] 
**company_prefecture_name** | **String** | 都道府県 | [optional] 
**company_address1** | **String** | 市区町村・番地 | [optional] 
**company_address2** | **String** | 建物名・部屋番号など | [optional] 
**company_contact_info** | **String** | 事業所担当者名 | [optional] 
**message** | **String** | メッセージ | [optional] 
**notes** | **String** | 備考 | [optional] 
**quotation_layout** | **String** | レイアウト(default_classic: レイアウト１/クラシック, standard_classic: レイアウト２/クラシック, envelope_classic: 封筒１/クラシック, carried_forward_standard_classic: レイアウト３（繰越金額欄あり）/クラシック, carried_forward_envelope_classic: 封筒２（繰越金額欄あり）/クラシック, default_modern: レイアウト１/モダン, standard_modern: レイアウト２/モダン, envelope_modern: 封筒/モダン) | 
**tax_entry_method** | **String** | 見積書の消費税計算方法(inclusive: 内税, exclusive: 外税) | 
**quotation_contents** | [**Array&lt;QuotationResponseQuotationQuotationContents&gt;**](QuotationResponseQuotationQuotationContents.md) | 見積内容 | [optional] 
**total_amount_per_vat_rate** | [**InvoiceResponseInvoiceTotalAmountPerVatRate**](InvoiceResponseInvoiceTotalAmountPerVatRate.md) |  | 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::QuotationResponseQuotation.new(id: 101,
                                 company_id: 1,
                                 issue_date: 2013-01-01,
                                 partner_id: 201,
                                 partner_code: code001,
                                 quotation_number: A001,
                                 title: 見積書,
                                 total_amount: 108000,
                                 total_vat: 8000,
                                 sub_total: 100000,
                                 description: ８月分見積書,
                                 quotation_status: null,
                                 web_published_at: 2013-03-01 10:00:00,
                                 web_downloaded_at: 2013-03-01 10:00:00,
                                 web_confirmed_at: 2013-03-01 10:00:00,
                                 mail_sent_at: 2013-03-01 10:00:00,
                                 partner_name: freeeパートナー,
                                 partner_display_name: 株式会社freeeパートナー,
                                 partner_title: 御中,
                                 partner_zipcode: 000-0000,
                                 partner_prefecture_code: 4,
                                 partner_prefecture_name: 秋田県,
                                 partner_address1: 湯沢市,
                                 partner_address2: Aビル,
                                 partner_contact_info: 営業担当,
                                 company_name: freee株式会社,
                                 company_zipcode: 000-0000,
                                 company_prefecture_code: 12,
                                 company_prefecture_name: 東京都,
                                 company_address1: ＸＸ区ＸＸ１−１−１,
                                 company_address2: ビル1F,
                                 company_contact_info: 法人営業担当,
                                 message: 下記の通り御見積もり申し上げます。,
                                 notes: 毎度お世話になっております。,
                                 quotation_layout: default_classic,
                                 tax_entry_method: exclusive,
                                 quotation_contents: null,
                                 total_amount_per_vat_rate: null)
```


