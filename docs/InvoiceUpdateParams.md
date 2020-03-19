# UnofficialFreeeSdk::InvoiceUpdateParams

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**company_id** | **Integer** | 事業所ID | 
**issue_date** | **String** | 請求日 (yyyy-mm-dd) | [optional] 
**partner_id** | **Integer** | 取引先ID | [optional] 
**partner_code** | **String** | 取引先コード | [optional] 
**invoice_number** | **String** | 請求書番号 (デフォルト: 自動採番されます) | [optional] 
**title** | **String** | タイトル (デフォルト: 請求書) | [optional] 
**due_date** | **String** | 期日 (yyyy-mm-dd) | [optional] 
**booking_date** | **String** | 売上計上日 | [optional] 
**description** | **String** | 概要 | [optional] 
**invoice_status** | **String** | 請求書ステータス  (draft: 下書き (デフォルト), issue: 発行(請求先ワークフローを利用している場合は承認済の請求書にのみ指定できます)) | [optional] 
**partner_name** | **String** | 請求書に表示する取引先名（未指定の場合は取引先の名称をそのまま利用します） | [optional] 
**partner_title** | **String** | 敬称（御中、様、(空白)の3つから選択） | [optional] 
**partner_contact_info** | **String** | 取引先担当者名 | [optional] 
**partner_zipcode** | **String** | 取引先郵便番号 (デフォルトはpartner_idもしくははpartner_codeで指定された取引先設定情報が補完されます) | [optional] 
**partner_prefecture_code** | **Integer** | 取引先都道府県コード（0:北海道、1:青森、2:岩手、3:宮城、4:秋田、5:山形、6:福島、7:茨城、8:栃木、9:群馬、10:埼玉、11:千葉、12:東京、13:神奈川、14:新潟、15:富山、16:石川、17:福井、18:山梨、19:長野、20:岐阜、21:静岡、22:愛知、23:三重、24:滋賀、25:京都、26:大阪、27:兵庫、28:奈良、29:和歌山、30:鳥取、31:島根、32:岡山、33:広島、34:山口、35:徳島、36:香川、37:愛媛、38:高知、39:福岡、40:佐賀、41:長崎、42:熊本、43:大分、44:宮崎、45:鹿児島、46:沖縄) (デフォルトはpartner_idもしくははpartner_codeで指定された取引先設定情報が補完されます) | [optional] 
**partner_address1** | **String** | 取引先市区町村・番地 (デフォルトはpartner_idもしくははpartner_codeで指定された取引先設定情報が補完されます) | [optional] 
**partner_address2** | **String** | 取引先建物名・部屋番号など (デフォルトはpartner_idもしくははpartner_codeで指定された取引先設定情報が補完されます) | [optional] 
**company_name** | **String** | 事業所名 (デフォルトは事業所設定情報が補完されます) | [optional] 
**company_zipcode** | **String** | 郵便番号 (デフォルトは事業所設定情報が補完されます) | [optional] 
**company_prefecture_code** | **Integer** | 都道府県コード（0:北海道、1:青森、2:岩手、3:宮城、4:秋田、5:山形、6:福島、7:茨城、8:栃木、9:群馬、10:埼玉、11:千葉、12:東京、13:神奈川、14:新潟、15:富山、16:石川、17:福井、18:山梨、19:長野、20:岐阜、21:静岡、22:愛知、23:三重、24:滋賀、25:京都、26:大阪、27:兵庫、28:奈良、29:和歌山、30:鳥取、31:島根、32:岡山、33:広島、34:山口、35:徳島、36:香川、37:愛媛、38:高知、39:福岡、40:佐賀、41:長崎、42:熊本、43:大分、44:宮崎、45:鹿児島、46:沖縄) (デフォルトは事業所設定情報が補完されます) | [optional] 
**company_address1** | **String** | 市区町村・番地 (デフォルトは事業所設定情報が補完されます) | [optional] 
**company_address2** | **String** | 建物名・部屋番号など (デフォルトは事業所設定情報が補完されます) | [optional] 
**company_contact_info** | **String** | 事業所担当者名 (デフォルトは事業所設定情報が補完されます) | [optional] 
**payment_type** | **String** | 支払方法 (振込: transfer, 引き落とし: direct_debit) | [optional] 
**payment_bank_info** | **String** | 支払口座 | [optional] 
**use_virtual_transfer_account** | **String** | 振込専用口座の利用(利用しない: not_use(デフォルト), 利用する: use) | [optional] 
**message** | **String** | メッセージ (デフォルト: 下記の通りご請求申し上げます。) | [optional] 
**notes** | **String** | 備考 | [optional] 
**invoice_layout** | **String** | レイアウト(default_classic: レイアウト１/クラシック (デフォルト), standard_classic: レイアウト２/クラシック, envelope_classic: 封筒１/クラシック, carried_forward_standard_classic: レイアウト３（繰越金額欄あり）/クラシック, carried_forward_envelope_classic: 封筒２（繰越金額欄あり）/クラシック, default_modern: レイアウト１/モダン, standard_modern: レイアウト２/モダン, envelope_modern: 封筒/モダン) | [optional] 
**tax_entry_method** | **String** | 請求書の消費税計算方法(inclusive: 内税表示, exclusive: 外税表示 (デフォルト)) | [optional] 
**invoice_contents** | [**Array&lt;InvoiceUpdateParamsInvoiceContents&gt;**](InvoiceUpdateParamsInvoiceContents.md) | 請求内容 | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::InvoiceUpdateParams.new(company_id: 1,
                                 issue_date: 2013-01-01,
                                 partner_id: 201,
                                 partner_code: code001,
                                 invoice_number: A001,
                                 title: 請求書,
                                 due_date: 2013-02-28,
                                 booking_date: 2013-01-01,
                                 description: ８月分請求書,
                                 invoice_status: null,
                                 partner_name: freeeパートナー株式会社,
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
                                 company_address2: ビル 1F,
                                 company_contact_info: 法人営業担当,
                                 payment_type: transfer,
                                 payment_bank_info: ＸＸ銀行ＹＹ支店 1111111,
                                 use_virtual_transfer_account: use,
                                 message: 下記の通りご請求申し上げます。,
                                 notes: 毎度ありがとうございます,
                                 invoice_layout: default_classic,
                                 tax_entry_method: exclusive,
                                 invoice_contents: null)
```


