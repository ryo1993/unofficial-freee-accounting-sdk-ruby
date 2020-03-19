# UnofficialFreeeSdk::SelectablesIndexResponseAccountCategories

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**balance** | **String** | 収支 | 
**org_code** | **String** | 事業形態（個人事業主: personal、法人: corporate） | 
**role** | **String** | カテゴリーコード | 
**title** | **String** | カテゴリー名 | 
**desc** | **String** | カテゴリーの説明 | [optional] 
**account_items** | [**Array&lt;SelectablesIndexResponseAccountItems&gt;**](SelectablesIndexResponseAccountItems.md) | 勘定科目の一覧 | 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::SelectablesIndexResponseAccountCategories.new(balance: expense,
                                 org_code: personal,
                                 role: ex_food,
                                 title: 飲食費,
                                 desc: 飲食に使用した経費,
                                 account_items: null)
```


