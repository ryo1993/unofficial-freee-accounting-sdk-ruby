# UnofficialFreeeSdk::SelectablesIndexResponseAccountGroups

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 決算書表示名（小カテゴリー）ID | 
**name** | **String** | 決算書表示名 | 
**account_structure_id** | **Integer** | 年度ID | 
**account_category_id** | **Integer** | 勘定科目カテゴリーID | 
**detail_type** | **Integer** | 詳細パラメータの種類 | [optional] 
**index** | **Integer** | 並び順 | 
**created_at** | **String** | 作成日時 | [optional] 
**updated_at** | **String** | 更新日時 | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::SelectablesIndexResponseAccountGroups.new(id: 1,
                                 name: 預託金,
                                 account_structure_id: 1,
                                 account_category_id: 1,
                                 detail_type: 1,
                                 index: 1,
                                 created_at: 2018-09-10T13:47:24.000+09:00,
                                 updated_at: 2018-09-10T13:47:24.000+09:00)
```


