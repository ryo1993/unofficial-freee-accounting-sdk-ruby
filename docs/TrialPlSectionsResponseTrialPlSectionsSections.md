# UnofficialFreeeSdk::TrialPlSectionsResponseTrialPlSectionsSections

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | 部門ID | 
**name** | **String** | 部門名 | [optional] 
**closing_balance** | **Integer** | 期末残高 | [optional] 
**partners** | [**Array&lt;TrialPlSectionsResponseTrialPlSectionsPartners&gt;**](TrialPlSectionsResponseTrialPlSectionsPartners.md) | breakdown_display_type:partner, account_item_display_type:account_item指定時のみ含まれる | [optional] 
**items** | [**Array&lt;TrialPlSectionsResponseTrialPlSectionsItems&gt;**](TrialPlSectionsResponseTrialPlSectionsItems.md) | breakdown_display_type:item, account_item_display_type:account_item指定時のみ含まれる | [optional] 

## Code Sample

```ruby
require 'UnofficialFreeeSdk'

instance = UnofficialFreeeSdk::TrialPlSectionsResponseTrialPlSectionsSections.new(id: 1,
                                 name: 開発部門,
                                 closing_balance: -25920,
                                 partners: null,
                                 items: null)
```


