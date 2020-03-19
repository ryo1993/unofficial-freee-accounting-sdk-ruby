# UnofficialFreeeSdk::CompanyUpdateResponseCompany

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 事業所ID | 
**name** | **String** | 事業所の正式名称 (100文字以内) | 
**name_kana** | **String** | 正式名称フリガナ (100文字以内) | 
**display_name** | **String** | 事業所名 | 
**tax_at_source_calc_type** | **Integer** | 源泉徴収税計算（0: 消費税を含める、1: 消費税を含めない） | 
**contact_name** | **String** | 担当者名 (50文字以内) | 
**head_count** | **Integer** | 従業員数（0: 経営者のみ、1: 2~5人、2: 6~10人、3: 11~20人、4: 21~30人、5: 31~40人、6: 41~100人、7: 100人以上 | 
**corporate_number** | **String** | 法人番号 (半角数字13桁、法人のみ) | 
**txn_number_format** | **String** | 仕訳番号形式（not_used: 使用しない、digits: 数字（例：5091824）、alnum: 英数字（例：59J0P）） | 
**default_wallet_account_id** | **Integer** | 決済口座のデフォルト | [optional] 
**private_settlement** | **Boolean** | プライベート資金/役員資金（false: 使用しない、true: 使用する） | 
**minus_format** | **Integer** | マイナスの表示方法（0: -、 1: △） | 
**role** | **String** | ユーザーの権限 | 
**phone1** | **String** | 電話番号１ | 
**phone2** | **String** | 電話番号２ | 
**fax** | **String** | FAX | 
**zipcode** | **String** | 郵便番号 | 
**prefecture_code** | **Integer** | 都道府県コード（0: 北海道、1:青森、2:岩手、3:宮城、4:秋田、5:山形、6:福島、7:茨城、8:栃木、9:群馬、10:埼玉、11:千葉、12:東京、13:神奈川、14:新潟、15:富山、16:石川、17:福井、18:山梨、19:長野、20:岐阜、21:静岡、22:愛知、23:三重、24:滋賀、25:京都、26:大阪、27:兵庫、28:奈良、29:和歌山、30:鳥取、31:島根、32:岡山、33:広島、34:山口、35:徳島、36:香川、37:愛媛、38:高知、39:福岡、40:佐賀、41:長崎、42:熊本、43:大分、44:宮崎、45:鹿児島、46:沖縄 | 
**street_name1** | **String** | 市区町村・番地 | 
**street_name2** | **String** | 建物名・部屋番号など | 
**invoice_layout** | **Integer** | レイアウト(0: レイアウト1, 1:レイアウト2, 3:封筒1, 4:レイアウト3(繰越金額欄あり), 5: 封筒2(繰越金額欄あり)) | 
**invoice_style** | **Integer** | スタイル(0: クラシック, 1: モダン) | 
**amount_fraction** | **Integer** | 金額端数処理方法（0: 切り捨て、1: 切り上げ、2: 四捨五入） | 
**industry_class** | **String** | 種別（agriculture_forestry_fisheries_ore: 農林水産業/鉱業、construction: 建設、manufacturing_processing: 製造/加工、it: IT、transportation_logistics: 運輸/物流、retail_wholesale: 小売/卸売、finance_insurance: 金融/保険、real_estate_rental: 不動産/レンタル、profession: 士業/学術/専門技術サービス、design_production: デザイン/制作、food: 飲食、leisure_entertainment: レジャー/娯楽、lifestyle: 生活関連サービス、education: 教育/学習支援、medical_welfare: 医療/福祉、other_services: その他サービス、other: その他） | 
**industry_code** | **String** | コード（transport_delivery: 輸送業/配送業、delivery: バイク便等の配達業、other_transportation_logistics: その他の運輸業、物流業） | 
**workflow_setting** | **String** | 仕訳承認フロー（enable: 有効、 disable: 無効） | 
**fiscal_years** | [**Array&lt;CompanyUpdateResponseCompanyFiscalYears&gt;**](CompanyUpdateResponseCompanyFiscalYears.md) |  | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::CompanyUpdateResponseCompany.new(id: 1,
                                 name: freee事務所,
                                 name_kana: フリージムショ,
                                 display_name: freee事務所,
                                 tax_at_source_calc_type: 0,
                                 contact_name: user1,
                                 head_count: 1,
                                 corporate_number: 1234567890123,
                                 txn_number_format: not_used,
                                 default_wallet_account_id: 1,
                                 private_settlement: true,
                                 minus_format: 0,
                                 role: admin,
                                 phone1: 03-1234-xxxx,
                                 phone2: 090-1234-xxxx,
                                 fax: 03-1234-xxxx,
                                 zipcode: 000-0000,
                                 prefecture_code: 4,
                                 street_name1: ＸＸ区ＹＹ１−１−１,
                                 street_name2: ビル１Ｆ,
                                 invoice_layout: 0,
                                 invoice_style: 0,
                                 amount_fraction: 0,
                                 industry_class: agriculture_forestry_fisheries_ore,
                                 industry_code: transport_delivery,
                                 workflow_setting: disabled,
                                 fiscal_years: null)
```


