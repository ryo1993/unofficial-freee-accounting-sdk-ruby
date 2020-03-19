# UnofficialFreeeSdk::CompanyParamsDocTemplate

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**invoice_layout** | **Integer** | レイアウト(0: レイアウト1, 1:レイアウト2, 3:封筒1, 4:レイアウト3(繰越金額欄あり), 5: 封筒2(繰越金額欄あり)) | [optional] 
**invoice_style** | **Integer** | スタイル(0: クラシック, 1: モダン) | [optional] 
**amount_fraction** | **Integer** | 金額端数処理方法（0: 切り上げ、1: 切り捨て, 2: 四捨五入） | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::CompanyParamsDocTemplate.new(invoice_layout: null,
                                 invoice_style: null,
                                 amount_fraction: null)
```


