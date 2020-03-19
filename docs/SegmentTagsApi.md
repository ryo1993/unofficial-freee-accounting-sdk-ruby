# UnofficialFreeeSdk::SegmentTagsApi

All URIs are relative to *https://api.freee.co.jp*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_segment_tag**](SegmentTagsApi.md#create_segment_tag) | **POST** /api/1/segments/{segment_id}/tags | セグメントの作成
[**destroy_segments_tag**](SegmentTagsApi.md#destroy_segments_tag) | **DELETE** /api/1/segments/{segment_id}/tags/{id} | セグメントタグの削除
[**get_segment_tags**](SegmentTagsApi.md#get_segment_tags) | **GET** /api/1/segments/{segment_id}/tags | セグメントタグ一覧の取得
[**update_segment_tag**](SegmentTagsApi.md#update_segment_tag) | **PUT** /api/1/segments/{segment_id}/tags/{id} | セグメントタグの更新



## create_segment_tag

> SegmentTagResponse create_segment_tag(segment_id, segment_tag_params)

セグメントの作成

 <h2 id=\"\">概要</h2>  <p>指定した事業所のセグメントタグを作成する</p>  <h2 id=\"\">注意点</h2>  <ul>  <li>本APIは法人向けのプロフェッショナルプラン以上で利用可能です。利用可能なセグメントの数は、法人向けのプロフェッショナルプランの場合は1つ、エンタープライズプランの場合は3つです。</li>  </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::SegmentTagsApi.new
segment_id = 56 # Integer | セグメントID
segment_tag_params = UnofficialFreeeSdk::SegmentTagParams.new # SegmentTagParams | セグメントタグの作成

begin
  #セグメントの作成
  result = api_instance.create_segment_tag(segment_id, segment_tag_params)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling SegmentTagsApi->create_segment_tag: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **segment_id** | **Integer**| セグメントID | 
 **segment_tag_params** | [**SegmentTagParams**](SegmentTagParams.md)| セグメントタグの作成 | 

### Return type

[**SegmentTagResponse**](SegmentTagResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json


## destroy_segments_tag

> destroy_segments_tag(segment_id, id, company_id)

セグメントタグの削除

 <h2 id=\"\">概要</h2>  <p>指定した事業所のセグメントタグを削除する</p>  <h2 id=\"\">注意点</h2>  <ul>  <li>本APIは法人向けのプロフェッショナルプラン以上で利用可能です。利用可能なセグメントの数は、法人向けのプロフェッショナルプランの場合は1つ、エンタープライズプランの場合は3つです。</li>  </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::SegmentTagsApi.new
segment_id = 56 # Integer | セグメントID
id = 56 # Integer | セグメントタグID
company_id = 56 # Integer | 事業所ID

begin
  #セグメントタグの削除
  api_instance.destroy_segments_tag(segment_id, id, company_id)
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling SegmentTagsApi->destroy_segments_tag: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **segment_id** | **Integer**| セグメントID | 
 **id** | **Integer**| セグメントタグID | 
 **company_id** | **Integer**| 事業所ID | 

### Return type

nil (empty response body)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_segment_tags

> InlineResponse20019 get_segment_tags(company_id, segment_id, opts)

セグメントタグ一覧の取得

 <h2 id=\"\">概要</h2>  <p>指定した事業所のセグメントタグ一覧を取得する</p>  <h2 id=\"\">注意点</h2>  <ul>  <li>本APIは法人向けのプロフェッショナルプラン以上で利用可能です。利用可能なセグメントの数は、法人向けのプロフェッショナルプランの場合は1つ、エンタープライズプランの場合は3つです。</li>  </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::SegmentTagsApi.new
company_id = 56 # Integer | 事業所ID
segment_id = 56 # Integer | セグメントID
opts = {
  offset: 56, # Integer | 取得レコードのオフセット (デフォルト: 0)
  limit: 56 # Integer | 取得レコードの件数 (デフォルト: 20, 最小: 1, 最大: 500) 
}

begin
  #セグメントタグ一覧の取得
  result = api_instance.get_segment_tags(company_id, segment_id, opts)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling SegmentTagsApi->get_segment_tags: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **company_id** | **Integer**| 事業所ID | 
 **segment_id** | **Integer**| セグメントID | 
 **offset** | **Integer**| 取得レコードのオフセット (デフォルト: 0) | [optional] 
 **limit** | **Integer**| 取得レコードの件数 (デフォルト: 20, 最小: 1, 最大: 500)  | [optional] 

### Return type

[**InlineResponse20019**](InlineResponse20019.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_segment_tag

> SegmentTagResponse update_segment_tag(segment_id, id, segment_tag_params)

セグメントタグの更新

 <h2 id=\"\">概要</h2>  <p>指定した事業所のセグメントタグを更新する</p>  <h2 id=\"\">注意点</h2>  <ul>  <li>本APIは法人向けのプロフェッショナルプラン以上で利用可能です。利用可能なセグメントの数は、法人向けのプロフェッショナルプランの場合は1つ、エンタープライズプランの場合は3つです。</li>  </ul>

### Example

```ruby
# load the gem
require 'unofficial_freee_sdk'
# setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = 'YOUR ACCESS TOKEN'
end

api_instance = UnofficialFreeeSdk::SegmentTagsApi.new
segment_id = 56 # Integer | セグメントID
id = 56 # Integer | セグメントタグID
segment_tag_params = UnofficialFreeeSdk::SegmentTagParams.new # SegmentTagParams | セグメントタグの作成

begin
  #セグメントタグの更新
  result = api_instance.update_segment_tag(segment_id, id, segment_tag_params)
  p result
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling SegmentTagsApi->update_segment_tag: #{e}"
end
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **segment_id** | **Integer**| セグメントID | 
 **id** | **Integer**| セグメントタグID | 
 **segment_tag_params** | [**SegmentTagParams**](SegmentTagParams.md)| セグメントタグの作成 | 

### Return type

[**SegmentTagResponse**](SegmentTagResponse.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded
- **Accept**: application/json

