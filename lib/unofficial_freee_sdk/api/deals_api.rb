=begin
#freee API

# <h1 id=\"freee_api\">freee API</h1> <hr /> <h2 id=\"\">スタートガイド</h2>  <p>freee API開発がはじめての方は<a href=\"https://developer.freee.co.jp/getting-started\">freee API スタートガイド</a>を参照してください。</p>  <hr /> <h2 id=\"_2\">仕様</h2>  <h3 id=\"api\">APIエンドポイント</h3>  <p>https://api.freee.co.jp/ (httpsのみ)</p>  <h3 id=\"_3\">認証方式</h3>  <p><a href=\"http://tools.ietf.org/html/rfc6749\">OAuth2</a>に対応</p>  <ul> <li>Authorization Code Flow (Webアプリ向け)</li>  <li>Implicit Flow (Mobileアプリ向け)</li> </ul>  <h3 id=\"_4\">認証エンドポイント</h3>  <p>https://accounts.secure.freee.co.jp/</p>  <ul> <li>authorize : https://accounts.secure.freee.co.jp/public_api/authorize</li>  <li>token : https://accounts.secure.freee.co.jp/public_api/token</li> </ul>  <h3 id=\"_5\">アクセストークンのリフレッシュ</h3>  <p>認証時に得たrefresh_token を使ってtoken の期限をリフレッシュして新規に発行することが出来ます。</p>  <p>grant_type=refresh_token で https://accounts.secure.freee.co.jp/public_api/token にアクセスすればリフレッシュされます。</p>  <p>e.g.)</p>  <p>POST: https://accounts.secure.freee.co.jp/public_api/token</p>  <p>params: grant_type=refresh_token&amp;client_id=UID&amp;client_secret=SECRET&amp;refresh_token=REFRESH_TOKEN</p>  <p>詳細は<a href=\"https://github.com/applicake/doorkeeper/wiki/Enable-Refresh-Token-Credentials#flow\">refresh_token</a>を参照下さい。</p>  <h3 id=\"_6\">アクセストークンの破棄</h3>  <p>認証時に得たaccess_tokenまたはrefresh_tokenを使って、tokenを破棄することができます。 token=access_tokenまたはtoken=refresh_tokenでhttps://accounts.secure.freee.co.jp/public_api/revokeにアクセスすると破棄されます。token_type_hintでaccess_tokenまたはrefresh_tokenを陽に指定できます。</p>  <p>e.g.)</p>  <p>POST: https://accounts.secure.freee.co.jp/public_api/revoke</p>  <p>params: token=ACCESS_TOKEN</p>  <p>または</p>  <p>params: token=REFRESH_TOKEN</p>  <p>または</p>  <p>params: token=ACCESS_TOKEN&amp;token_type_hint=access_token</p>  <p>または</p>  <p>params: token=REFRESH_TOKEN&amp;token_type_hint=refresh_token</p>  <p>詳細は <a href=\"https://tools.ietf.org/html/rfc7009\">OAuth 2.0 Token revocation</a> をご参照ください。</p>  <h3 id=\"_7\">データフォーマット</h3>  <p>リクエスト、レスポンスともにJSON形式をサポート</p>  <h3 id=\"_8\">後方互換性ありの変更</h3>  <p>freeeでは、APIを改善していくために以下のような変更は後方互換性ありとして通知なく変更を入れることがあります。アプリケーション実装者は以下を踏まえて開発を行ってください。</p>  <ul> <li>新しいAPIリソース・エンドポイントの追加</li> <li>既存のAPIに対して必須ではない新しいリクエストパラメータの追加</li> <li>既存のAPIレスポンスに対する新しいプロパティの追加</li> <li>既存のAPIレスポンスに対するプロパティの順番の入れ変え</li> <li>keyとなっているidやcodeの長さの変更（長くする）</li> </ul>  <h3 id=\"_9\">共通レスポンスヘッダー</h3>  <p>すべてのAPIのレスポンスには以下のHTTPヘッダーが含まれます。</p>  <ul> <li> <p>X-Freee-Request-ID</p> <ul> <li>各リクエスト毎に発行されるID</li> </ul> </li> </ul>  <h3 id=\"_10\">共通エラーレスポンス</h3>  <ul> <li> <p>ステータスコードはレスポンス内のJSONに含まれる他、HTTPヘッダにも含まれる</p> </li>  <li> <p>type</p>  <ul> <li>status : HTTPステータスコードの説明</li>  <li>validation : エラーの詳細の説明（開発者向け）</li> </ul> </li> </ul>  <p>レスポンスの例</p>  <pre><code>  {     &quot;status_code&quot; : 400,     &quot;errors&quot; : [       {         &quot;type&quot; : &quot;status&quot;,         &quot;messages&quot; : [&quot;不正なリクエストです。&quot;]       },       {         &quot;type&quot; : &quot;validation&quot;,         &quot;messages&quot; : [&quot;Date は不正な日付フォーマットです。入力例：2013-01-01&quot;]       }     ]   }</code></pre>  </br>  <h3 id=\"_11\">API使用制限</h3>    <p>freeeは一定期間に過度のアクセスを検知した場合、APIアクセスをコントロールする場合があります。</p>   <p>その際のhttp status codeは403となります。制限がかかってから10分程度が過ぎると再度使用することができるようになります。</p>  <h4 id=\"_12\">/reportsエンドポイント</h4>  <p>freeeは/reportsエンドポイントに対して1秒間に10以上のアクセスを検知した場合、APIアクセスをコントロールする場合があります。その際のhttp status codeは429（too many requests）となります。</p>  <p>レスポンスボディのmetaプロパティに以下を含めます。</p>  <ul>   <li>設定されている上限値</li>   <li>上限に達するまでの使用可能回数</li>   <li>（上限値に達した場合）使用回数がリセットされる時刻</li> </ul>  <h3 id=\"_13\">プラン別のAPI Rate Limit</h3>   <table border=\"1\">     <tbody>       <tr>         <th style=\"padding: 10px\"><strong>会計freeeプラン名</strong></th>         <th style=\"padding: 10px\"><strong>事業所とアプリケーション毎に1日でのAPIコール数</strong></th>       </tr>       <tr>         <td style=\"padding: 10px\">エンタープライズ</td>         <td style=\"padding: 10px\">10,000</td>       </tr>       <tr>         <td style=\"padding: 10px\">プロフェッショナル</td>         <td style=\"padding: 10px\">5,000</td>       </tr>       <tr>         <td style=\"padding: 10px\">ベーシック</td>         <td style=\"padding: 10px\">3,000</td>       </tr>       <tr>         <td style=\"padding: 10px\">ミニマム</td>         <td style=\"padding: 10px\">3,000</td>       </tr>       <tr>         <td style=\"padding: 10px\">上記以外</td>         <td style=\"padding: 10px\">3,000</td>       </tr>     </tbody>   </table>  <hr /> <h2 id=\"_14\">連絡先</h2>  <p>ご不明点、ご要望等は <a href=\"https://support.freee.co.jp/hc/ja/requests/new\">freee サポートデスクへのお問い合わせフォーム</a> からご連絡ください。</p> <hr />&copy; Since 2013 freee K.K.

The version of the OpenAPI document: v1.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.2.3

=end

require 'cgi'

module UnofficialFreeeSdk
  class DealsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # 取引（収入／支出）の作成
    # <h2 id=\"\">概要</h2> <p>指定した事業所の取引（収入／支出）を作成する</p> <h2 id=\"_2\">定義</h2> <ul> <li> <p>issue_date : 発生日</p> </li> <li> <p>due_date : 支払期日</p> </li> <li> <p>amount : 金額</p> </li> <li> <p>due_amount : 支払残額</p> </li> <li> <p>type</p> <ul> <li>income : 収入</li> <li>expense : 支出</li> </ul> </li> <li> <p>ref_number : 管理番号</p> </li> <li> <p>details : 取引の明細行</p> </li> <li> <p>payments : 取引の支払行</p> </li> <li> <p>receipt_ids : 証憑ファイルID</p> </li> <li> <p>from_walletable_type</p> <ul> <li>bank_account : 銀行口座</li> <li>credit_card : クレジットカード</li> <li>wallet : 現金</li> <li>private_account_item : プライベート資金（法人の場合は役員借入金もしくは役員借入金、個人の場合は事業主貸もしくは事業主借）</li> </ul> </li> </ul> <h2 id=\"_3\">注意点</h2> <ul> <li> <p>tax_idは廃止予定です。tax_codeをご利用ください。</p> </li> <li> <p>tax_code, tax_idはどちらかの指定が必須です。両方指定した場合はtax_codeが優先されます。</p> </li> <p><li>本APIでは+更新行(renews)の操作ができません。+更新行の作成APIをご利用ください。</p></li> <p><li>セグメントタグ情報は法人向けのプロフェッショナルプラン以上で利用可能です。利用可能なセグメントの数は、法人向けのプロフェッショナルプランの場合は1つ、エンタープライズプランの場合は3つです。</p></li> <li> <p>partner_codeを利用するには、事業所の設定から取引先コードの利用を有効にする必要があります。またpartner_codeとpartner_idは同時に指定することはできません。</p></li> </ul> 
    # @param [Hash] opts the optional parameters
    # @option opts [DealCreateParams] :deal_create_params 取引（収入／支出）の作成
    # @return [DealCreateResponse]
    def create_deal(opts = {})
      data, _status_code, _headers = create_deal_with_http_info(opts)
      data
    end

    # 取引（収入／支出）の作成
    # &lt;h2 id&#x3D;\&quot;\&quot;&gt;概要&lt;/h2&gt; &lt;p&gt;指定した事業所の取引（収入／支出）を作成する&lt;/p&gt; &lt;h2 id&#x3D;\&quot;_2\&quot;&gt;定義&lt;/h2&gt; &lt;ul&gt; &lt;li&gt; &lt;p&gt;issue_date : 発生日&lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;due_date : 支払期日&lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;amount : 金額&lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;due_amount : 支払残額&lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;type&lt;/p&gt; &lt;ul&gt; &lt;li&gt;income : 収入&lt;/li&gt; &lt;li&gt;expense : 支出&lt;/li&gt; &lt;/ul&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;ref_number : 管理番号&lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;details : 取引の明細行&lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;payments : 取引の支払行&lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;receipt_ids : 証憑ファイルID&lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;from_walletable_type&lt;/p&gt; &lt;ul&gt; &lt;li&gt;bank_account : 銀行口座&lt;/li&gt; &lt;li&gt;credit_card : クレジットカード&lt;/li&gt; &lt;li&gt;wallet : 現金&lt;/li&gt; &lt;li&gt;private_account_item : プライベート資金（法人の場合は役員借入金もしくは役員借入金、個人の場合は事業主貸もしくは事業主借）&lt;/li&gt; &lt;/ul&gt; &lt;/li&gt; &lt;/ul&gt; &lt;h2 id&#x3D;\&quot;_3\&quot;&gt;注意点&lt;/h2&gt; &lt;ul&gt; &lt;li&gt; &lt;p&gt;tax_idは廃止予定です。tax_codeをご利用ください。&lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;tax_code, tax_idはどちらかの指定が必須です。両方指定した場合はtax_codeが優先されます。&lt;/p&gt; &lt;/li&gt; &lt;p&gt;&lt;li&gt;本APIでは+更新行(renews)の操作ができません。+更新行の作成APIをご利用ください。&lt;/p&gt;&lt;/li&gt; &lt;p&gt;&lt;li&gt;セグメントタグ情報は法人向けのプロフェッショナルプラン以上で利用可能です。利用可能なセグメントの数は、法人向けのプロフェッショナルプランの場合は1つ、エンタープライズプランの場合は3つです。&lt;/p&gt;&lt;/li&gt; &lt;li&gt; &lt;p&gt;partner_codeを利用するには、事業所の設定から取引先コードの利用を有効にする必要があります。またpartner_codeとpartner_idは同時に指定することはできません。&lt;/p&gt;&lt;/li&gt; &lt;/ul&gt; 
    # @param [Hash] opts the optional parameters
    # @option opts [DealCreateParams] :deal_create_params 取引（収入／支出）の作成
    # @return [Array<(DealCreateResponse, Integer, Hash)>] DealCreateResponse data, response status code and response headers
    def create_deal_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: DealsApi.create_deal ...'
      end
      # resource path
      local_var_path = '/api/1/deals'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/x-www-form-urlencoded'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] || @api_client.object_to_http_body(opts[:'deal_create_params']) 

      # return_type
      return_type = opts[:return_type] || 'DealCreateResponse' 

      # auth_names
      auth_names = opts[:auth_names] || ['oauth2']

      new_options = opts.merge(
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DealsApi#create_deal\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # 取引（収入／支出）の削除
    # @param id [Integer] 取引ID
    # @param company_id [Integer] 事業所ID
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def destroy_deal(id, company_id, opts = {})
      destroy_deal_with_http_info(id, company_id, opts)
      nil
    end

    # 取引（収入／支出）の削除
    # @param id [Integer] 取引ID
    # @param company_id [Integer] 事業所ID
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def destroy_deal_with_http_info(id, company_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: DealsApi.destroy_deal ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling DealsApi.destroy_deal"
      end
      if @api_client.config.client_side_validation && id > 999999999999
        fail ArgumentError, 'invalid value for "id" when calling DealsApi.destroy_deal, must be smaller than or equal to 999999999999.'
      end

      if @api_client.config.client_side_validation && id < 1
        fail ArgumentError, 'invalid value for "id" when calling DealsApi.destroy_deal, must be greater than or equal to 1.'
      end

      # verify the required parameter 'company_id' is set
      if @api_client.config.client_side_validation && company_id.nil?
        fail ArgumentError, "Missing the required parameter 'company_id' when calling DealsApi.destroy_deal"
      end
      if @api_client.config.client_side_validation && company_id > 4294967295
        fail ArgumentError, 'invalid value for "company_id" when calling DealsApi.destroy_deal, must be smaller than or equal to 4294967295.'
      end

      if @api_client.config.client_side_validation && company_id < 1
        fail ArgumentError, 'invalid value for "company_id" when calling DealsApi.destroy_deal, must be greater than or equal to 1.'
      end

      # resource path
      local_var_path = '/api/1/deals/{id}'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'company_id'] = company_id

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] 

      # return_type
      return_type = opts[:return_type] 

      # auth_names
      auth_names = opts[:auth_names] || ['oauth2']

      new_options = opts.merge(
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DealsApi#destroy_deal\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # 取引（収入／支出）の取得
    # <h2 id=\"\">概要</h2> <p>指定した事業所の取引（収入／支出）を取得する</p> <h2 id=\"_2\">定義</h2> <ul> <li> <p>issue_date : 発生日</p> </li> <li> <p>due_date : 支払期日</p> </li> <li> <p>amount : 金額</p> </li> <li> <p>due_amount : 支払残額</p> </li> <li> <p>type</p> <ul> <li>income : 収入</li> <li>expense : 支出</li> </ul> </li> <li> <p>details : 取引の明細行</p> </li> <li> <p>accruals : 取引の債権債務行</p> </li> <li> <p>renews : 取引の+更新行</p> </li> <li> <p>payments : 取引の支払行</p> </li> <li> <p>from_walletable_type</p> <ul> <li>bank_account : 銀行口座</li> <li>credit_card : クレジットカード</li> <li>wallet : 現金</li> <li>private_account_item : プライベート資金（法人の場合は役員借入金もしくは役員借入金、個人の場合は事業主貸もしくは事業主借）</li> </ul> </li> <li> <p>registered_from</p> <ul> <li>all : すべての取引</li> <li>me : 自身が登録した取引</li> </ul> </li> </ul> <h2 id=\"_3\">注意点</h2> <ul> <li>tax_idは廃止予定です。tax_codeをご利用ください。</li> <li>セグメントタグ情報は法人向けのプロフェッショナルプラン以上で利用可能です。利用可能なセグメントの数は、法人向けのプロフェッショナルプランの場合は1つ、エンタープライズプランの場合は3つです。</li> </ul>
    # @param company_id [Integer] 事業所ID
    # @param id [Integer] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :accruals 取引の債権債務行の表示（without: 表示しない(デフォルト), with: 表示する）
    # @return [DealResponse]
    def get_deal(company_id, id, opts = {})
      data, _status_code, _headers = get_deal_with_http_info(company_id, id, opts)
      data
    end

    # 取引（収入／支出）の取得
    # &lt;h2 id&#x3D;\&quot;\&quot;&gt;概要&lt;/h2&gt; &lt;p&gt;指定した事業所の取引（収入／支出）を取得する&lt;/p&gt; &lt;h2 id&#x3D;\&quot;_2\&quot;&gt;定義&lt;/h2&gt; &lt;ul&gt; &lt;li&gt; &lt;p&gt;issue_date : 発生日&lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;due_date : 支払期日&lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;amount : 金額&lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;due_amount : 支払残額&lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;type&lt;/p&gt; &lt;ul&gt; &lt;li&gt;income : 収入&lt;/li&gt; &lt;li&gt;expense : 支出&lt;/li&gt; &lt;/ul&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;details : 取引の明細行&lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;accruals : 取引の債権債務行&lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;renews : 取引の+更新行&lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;payments : 取引の支払行&lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;from_walletable_type&lt;/p&gt; &lt;ul&gt; &lt;li&gt;bank_account : 銀行口座&lt;/li&gt; &lt;li&gt;credit_card : クレジットカード&lt;/li&gt; &lt;li&gt;wallet : 現金&lt;/li&gt; &lt;li&gt;private_account_item : プライベート資金（法人の場合は役員借入金もしくは役員借入金、個人の場合は事業主貸もしくは事業主借）&lt;/li&gt; &lt;/ul&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;registered_from&lt;/p&gt; &lt;ul&gt; &lt;li&gt;all : すべての取引&lt;/li&gt; &lt;li&gt;me : 自身が登録した取引&lt;/li&gt; &lt;/ul&gt; &lt;/li&gt; &lt;/ul&gt; &lt;h2 id&#x3D;\&quot;_3\&quot;&gt;注意点&lt;/h2&gt; &lt;ul&gt; &lt;li&gt;tax_idは廃止予定です。tax_codeをご利用ください。&lt;/li&gt; &lt;li&gt;セグメントタグ情報は法人向けのプロフェッショナルプラン以上で利用可能です。利用可能なセグメントの数は、法人向けのプロフェッショナルプランの場合は1つ、エンタープライズプランの場合は3つです。&lt;/li&gt; &lt;/ul&gt;
    # @param company_id [Integer] 事業所ID
    # @param id [Integer] 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :accruals 取引の債権債務行の表示（without: 表示しない(デフォルト), with: 表示する）
    # @return [Array<(DealResponse, Integer, Hash)>] DealResponse data, response status code and response headers
    def get_deal_with_http_info(company_id, id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: DealsApi.get_deal ...'
      end
      # verify the required parameter 'company_id' is set
      if @api_client.config.client_side_validation && company_id.nil?
        fail ArgumentError, "Missing the required parameter 'company_id' when calling DealsApi.get_deal"
      end
      if @api_client.config.client_side_validation && company_id > 4294967295
        fail ArgumentError, 'invalid value for "company_id" when calling DealsApi.get_deal, must be smaller than or equal to 4294967295.'
      end

      if @api_client.config.client_side_validation && company_id < 1
        fail ArgumentError, 'invalid value for "company_id" when calling DealsApi.get_deal, must be greater than or equal to 1.'
      end

      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling DealsApi.get_deal"
      end
      if @api_client.config.client_side_validation && id > 999999999999
        fail ArgumentError, 'invalid value for "id" when calling DealsApi.get_deal, must be smaller than or equal to 999999999999.'
      end

      if @api_client.config.client_side_validation && id < 1
        fail ArgumentError, 'invalid value for "id" when calling DealsApi.get_deal, must be greater than or equal to 1.'
      end

      allowable_values = ["without", "with"]
      if @api_client.config.client_side_validation && opts[:'accruals'] && !allowable_values.include?(opts[:'accruals'])
        fail ArgumentError, "invalid value for \"accruals\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/api/1/deals/{id}'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'company_id'] = company_id
      query_params[:'accruals'] = opts[:'accruals'] if !opts[:'accruals'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] 

      # return_type
      return_type = opts[:return_type] || 'DealResponse' 

      # auth_names
      auth_names = opts[:auth_names] || ['oauth2']

      new_options = opts.merge(
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DealsApi#get_deal\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # 取引（収入／支出）一覧の取得
    # <h2 id=\"\">概要</h2> <p>指定した事業所の取引一覧（収入／支出）を取得する</p> <h2 id=\"_2\">定義</h2> <ul> <li> <p>issue_date : 発生日</p> </li> <li> <p>due_date : 支払期日</p> </li> <li> <p>amount : 金額</p> </li> <li> <p>due_amount : 支払残額</p> </li> <li> <p>type</p> <ul> <li>income : 収入</li> <li>expense : 支出</li> </ul> </li> <li> <p>details : 取引の明細行</p> </li> <li> <p>accruals : 取引の債権債務行</p> </li> <li> <p>renews : 取引の+更新行</p> </li> <li> <p>payments : 取引の支払行</p> </li> <li> <p>from_walletable_type</p> <ul> <li>bank_account : 銀行口座</li> <li>credit_card : クレジットカード</li> <li>wallet : 現金</li> <li>private_account_item : プライベート資金（法人の場合は役員借入金もしくは役員借入金、個人の場合は事業主貸もしくは事業主借）</li> </ul> </li> <li> <p>registered_from</p> <ul> <li>all : すべての取引</li> <li>me : 自身が登録した取引</li> </ul> </li> </ul> <h2 id=\"_3\">注意点</h2> <ul> <li>tax_idは廃止予定です。tax_codeをご利用ください。</li> <li>セグメントタグ情報は法人向けのプロフェッショナルプラン以上で利用可能です。利用可能なセグメントの数は、法人向けのプロフェッショナルプランの場合は1つ、エンタープライズプランの場合は3つです。</li> <li>partner_codeを利用するには、事業所の設定から取引先コードの利用を有効にする必要があります。またpartner_codeとpartner_idは同時に指定することはできません。</li> </ul>
    # @param company_id [Integer] 事業所ID
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :partner_id 取引先IDで絞込
    # @option opts [Integer] :account_item_id 勘定科目IDで絞込
    # @option opts [String] :partner_code 取引先コードで絞込
    # @option opts [String] :status 決済状況で絞込 (未決済: unsettled, 完了: settled)
    # @option opts [String] :type 収支区分 (収入: income, 支出: expense)
    # @option opts [String] :start_issue_date 発生日で絞込：開始日(yyyy-mm-dd)
    # @option opts [String] :end_issue_date 発生日で絞込：終了日(yyyy-mm-dd)
    # @option opts [String] :start_due_date 支払期日で絞込：開始日(yyyy-mm-dd)
    # @option opts [String] :end_due_date 支払期日で絞込：終了日(yyyy-mm-dd)
    # @option opts [String] :start_renew_date +更新日で絞込：開始日(yyyy-mm-dd)
    # @option opts [String] :end_renew_date +更新日で絞込：終了日(yyyy-mm-dd)
    # @option opts [Integer] :offset 取得レコードのオフセット (デフォルト: 0)
    # @option opts [Integer] :limit 取得レコードの件数 (デフォルト: 20, 最大: 100) 
    # @option opts [String] :registered_from 取引登録元アプリで絞込（me: 本APIを叩くアプリ自身から登録した取引のみ）
    # @option opts [String] :accruals 取引の債権債務行の表示（without: 表示しない(デフォルト), with: 表示する）
    # @return [InlineResponse2005]
    def get_deals(company_id, opts = {})
      data, _status_code, _headers = get_deals_with_http_info(company_id, opts)
      data
    end

    # 取引（収入／支出）一覧の取得
    # &lt;h2 id&#x3D;\&quot;\&quot;&gt;概要&lt;/h2&gt; &lt;p&gt;指定した事業所の取引一覧（収入／支出）を取得する&lt;/p&gt; &lt;h2 id&#x3D;\&quot;_2\&quot;&gt;定義&lt;/h2&gt; &lt;ul&gt; &lt;li&gt; &lt;p&gt;issue_date : 発生日&lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;due_date : 支払期日&lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;amount : 金額&lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;due_amount : 支払残額&lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;type&lt;/p&gt; &lt;ul&gt; &lt;li&gt;income : 収入&lt;/li&gt; &lt;li&gt;expense : 支出&lt;/li&gt; &lt;/ul&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;details : 取引の明細行&lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;accruals : 取引の債権債務行&lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;renews : 取引の+更新行&lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;payments : 取引の支払行&lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;from_walletable_type&lt;/p&gt; &lt;ul&gt; &lt;li&gt;bank_account : 銀行口座&lt;/li&gt; &lt;li&gt;credit_card : クレジットカード&lt;/li&gt; &lt;li&gt;wallet : 現金&lt;/li&gt; &lt;li&gt;private_account_item : プライベート資金（法人の場合は役員借入金もしくは役員借入金、個人の場合は事業主貸もしくは事業主借）&lt;/li&gt; &lt;/ul&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;registered_from&lt;/p&gt; &lt;ul&gt; &lt;li&gt;all : すべての取引&lt;/li&gt; &lt;li&gt;me : 自身が登録した取引&lt;/li&gt; &lt;/ul&gt; &lt;/li&gt; &lt;/ul&gt; &lt;h2 id&#x3D;\&quot;_3\&quot;&gt;注意点&lt;/h2&gt; &lt;ul&gt; &lt;li&gt;tax_idは廃止予定です。tax_codeをご利用ください。&lt;/li&gt; &lt;li&gt;セグメントタグ情報は法人向けのプロフェッショナルプラン以上で利用可能です。利用可能なセグメントの数は、法人向けのプロフェッショナルプランの場合は1つ、エンタープライズプランの場合は3つです。&lt;/li&gt; &lt;li&gt;partner_codeを利用するには、事業所の設定から取引先コードの利用を有効にする必要があります。またpartner_codeとpartner_idは同時に指定することはできません。&lt;/li&gt; &lt;/ul&gt;
    # @param company_id [Integer] 事業所ID
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :partner_id 取引先IDで絞込
    # @option opts [Integer] :account_item_id 勘定科目IDで絞込
    # @option opts [String] :partner_code 取引先コードで絞込
    # @option opts [String] :status 決済状況で絞込 (未決済: unsettled, 完了: settled)
    # @option opts [String] :type 収支区分 (収入: income, 支出: expense)
    # @option opts [String] :start_issue_date 発生日で絞込：開始日(yyyy-mm-dd)
    # @option opts [String] :end_issue_date 発生日で絞込：終了日(yyyy-mm-dd)
    # @option opts [String] :start_due_date 支払期日で絞込：開始日(yyyy-mm-dd)
    # @option opts [String] :end_due_date 支払期日で絞込：終了日(yyyy-mm-dd)
    # @option opts [String] :start_renew_date +更新日で絞込：開始日(yyyy-mm-dd)
    # @option opts [String] :end_renew_date +更新日で絞込：終了日(yyyy-mm-dd)
    # @option opts [Integer] :offset 取得レコードのオフセット (デフォルト: 0)
    # @option opts [Integer] :limit 取得レコードの件数 (デフォルト: 20, 最大: 100) 
    # @option opts [String] :registered_from 取引登録元アプリで絞込（me: 本APIを叩くアプリ自身から登録した取引のみ）
    # @option opts [String] :accruals 取引の債権債務行の表示（without: 表示しない(デフォルト), with: 表示する）
    # @return [Array<(InlineResponse2005, Integer, Hash)>] InlineResponse2005 data, response status code and response headers
    def get_deals_with_http_info(company_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: DealsApi.get_deals ...'
      end
      # verify the required parameter 'company_id' is set
      if @api_client.config.client_side_validation && company_id.nil?
        fail ArgumentError, "Missing the required parameter 'company_id' when calling DealsApi.get_deals"
      end
      if @api_client.config.client_side_validation && company_id > 4294967295
        fail ArgumentError, 'invalid value for "company_id" when calling DealsApi.get_deals, must be smaller than or equal to 4294967295.'
      end

      if @api_client.config.client_side_validation && company_id < 1
        fail ArgumentError, 'invalid value for "company_id" when calling DealsApi.get_deals, must be greater than or equal to 1.'
      end

      if @api_client.config.client_side_validation && !opts[:'partner_id'].nil? && opts[:'partner_id'] > 999999999999
        fail ArgumentError, 'invalid value for "opts[:"partner_id"]" when calling DealsApi.get_deals, must be smaller than or equal to 999999999999.'
      end

      if @api_client.config.client_side_validation && !opts[:'partner_id'].nil? && opts[:'partner_id'] < 1
        fail ArgumentError, 'invalid value for "opts[:"partner_id"]" when calling DealsApi.get_deals, must be greater than or equal to 1.'
      end

      if @api_client.config.client_side_validation && !opts[:'account_item_id'].nil? && opts[:'account_item_id'] > 999999999999
        fail ArgumentError, 'invalid value for "opts[:"account_item_id"]" when calling DealsApi.get_deals, must be smaller than or equal to 999999999999.'
      end

      if @api_client.config.client_side_validation && !opts[:'account_item_id'].nil? && opts[:'account_item_id'] < 1
        fail ArgumentError, 'invalid value for "opts[:"account_item_id"]" when calling DealsApi.get_deals, must be greater than or equal to 1.'
      end

      allowable_values = ["unsettled", "settled"]
      if @api_client.config.client_side_validation && opts[:'status'] && !allowable_values.include?(opts[:'status'])
        fail ArgumentError, "invalid value for \"status\", must be one of #{allowable_values}"
      end
      allowable_values = ["income", "expense"]
      if @api_client.config.client_side_validation && opts[:'type'] && !allowable_values.include?(opts[:'type'])
        fail ArgumentError, "invalid value for \"type\", must be one of #{allowable_values}"
      end
      if @api_client.config.client_side_validation && !opts[:'offset'].nil? && opts[:'offset'] > 9223372036854775807
        fail ArgumentError, 'invalid value for "opts[:"offset"]" when calling DealsApi.get_deals, must be smaller than or equal to 9223372036854775807.'
      end

      if @api_client.config.client_side_validation && !opts[:'offset'].nil? && opts[:'offset'] < 0
        fail ArgumentError, 'invalid value for "opts[:"offset"]" when calling DealsApi.get_deals, must be greater than or equal to 0.'
      end

      if @api_client.config.client_side_validation && !opts[:'limit'].nil? && opts[:'limit'] > 100
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling DealsApi.get_deals, must be smaller than or equal to 100.'
      end

      if @api_client.config.client_side_validation && !opts[:'limit'].nil? && opts[:'limit'] < 1
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling DealsApi.get_deals, must be greater than or equal to 1.'
      end

      allowable_values = ["me"]
      if @api_client.config.client_side_validation && opts[:'registered_from'] && !allowable_values.include?(opts[:'registered_from'])
        fail ArgumentError, "invalid value for \"registered_from\", must be one of #{allowable_values}"
      end
      allowable_values = ["without", "with"]
      if @api_client.config.client_side_validation && opts[:'accruals'] && !allowable_values.include?(opts[:'accruals'])
        fail ArgumentError, "invalid value for \"accruals\", must be one of #{allowable_values}"
      end
      # resource path
      local_var_path = '/api/1/deals'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'company_id'] = company_id
      query_params[:'partner_id'] = opts[:'partner_id'] if !opts[:'partner_id'].nil?
      query_params[:'account_item_id'] = opts[:'account_item_id'] if !opts[:'account_item_id'].nil?
      query_params[:'partner_code'] = opts[:'partner_code'] if !opts[:'partner_code'].nil?
      query_params[:'status'] = opts[:'status'] if !opts[:'status'].nil?
      query_params[:'type'] = opts[:'type'] if !opts[:'type'].nil?
      query_params[:'start_issue_date'] = opts[:'start_issue_date'] if !opts[:'start_issue_date'].nil?
      query_params[:'end_issue_date'] = opts[:'end_issue_date'] if !opts[:'end_issue_date'].nil?
      query_params[:'start_due_date'] = opts[:'start_due_date'] if !opts[:'start_due_date'].nil?
      query_params[:'end_due_date'] = opts[:'end_due_date'] if !opts[:'end_due_date'].nil?
      query_params[:'start_renew_date'] = opts[:'start_renew_date'] if !opts[:'start_renew_date'].nil?
      query_params[:'end_renew_date'] = opts[:'end_renew_date'] if !opts[:'end_renew_date'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'registered_from'] = opts[:'registered_from'] if !opts[:'registered_from'].nil?
      query_params[:'accruals'] = opts[:'accruals'] if !opts[:'accruals'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] 

      # return_type
      return_type = opts[:return_type] || 'InlineResponse2005' 

      # auth_names
      auth_names = opts[:auth_names] || ['oauth2']

      new_options = opts.merge(
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DealsApi#get_deals\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # 取引（収入／支出）の更新
    # <h2 id=\"\">概要</h2> <p>指定した事業所の取引（収入／支出）を更新する</p> <h2 id=\"_2\">定義</h2> <ul> <li> <p>issue_date : 発生日</p> </li> <li> <p>due_date : 支払期日</p> </li> <li> <p>amount : 金額</p> </li> <li> <p>due_amount : 支払残額</p> </li> <li> <p>type</p> <ul> <li>income : 収入</li> <li>expense : 支出</li> </ul> </li> <li> <p>details : 取引の明細行</p> </li> <li> <p>renews : 取引の+更新行</p> </li> <li> <p>payments : 取引の支払行</p> </li> <li> <p>from_walletable_type</p> <ul> <li>bank_account : 銀行口座</li> <li>credit_card : クレジットカード</li> <li>wallet : 現金</li> <li>private_account_item : プライベート資金（法人の場合は役員借入金もしくは役員借入金、個人の場合は事業主貸もしくは事業主借）</li> </ul> </li> <li> <p>receipt_ids : 証憑ファイルID</p> </li> </ul> <h2 id=\"_3\">注意点</h2> <ul> <li>本APIでは支払行(payments)の操作ができません。支払行の作成・更新・削除APIをご利用ください。</li> <li>本APIでは+更新行(renews)の操作ができません。+更新行の作成・更新・削除APIをご利用ください。</li> <li>本APIでは収入／支出の切替えができません。既存の取引を削除後、再度作成してください。</li> <li>本APIで取引を更新すると、消費税の計算方法は必ず内税方式が選択されます。</li> <li>セグメントタグ情報は法人向けのプロフェッショナルプラン以上で利用可能です。利用可能なセグメントの数は、法人向けのプロフェッショナルプランの場合は1つ、エンタープライズプランの場合は3つです。</li> <li>partner_codeを利用するには、事業所の設定から取引先コードの利用を有効にする必要があります。またpartner_codeとpartner_idは同時に指定することはできません。</ul>
    # @param id [Integer] 取引ID
    # @param [Hash] opts the optional parameters
    # @option opts [DealUpdateParams] :deal_update_params 取引（収入／支出）の更新
    # @return [DealResponse]
    def update_deal(id, opts = {})
      data, _status_code, _headers = update_deal_with_http_info(id, opts)
      data
    end

    # 取引（収入／支出）の更新
    # &lt;h2 id&#x3D;\&quot;\&quot;&gt;概要&lt;/h2&gt; &lt;p&gt;指定した事業所の取引（収入／支出）を更新する&lt;/p&gt; &lt;h2 id&#x3D;\&quot;_2\&quot;&gt;定義&lt;/h2&gt; &lt;ul&gt; &lt;li&gt; &lt;p&gt;issue_date : 発生日&lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;due_date : 支払期日&lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;amount : 金額&lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;due_amount : 支払残額&lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;type&lt;/p&gt; &lt;ul&gt; &lt;li&gt;income : 収入&lt;/li&gt; &lt;li&gt;expense : 支出&lt;/li&gt; &lt;/ul&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;details : 取引の明細行&lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;renews : 取引の+更新行&lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;payments : 取引の支払行&lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;from_walletable_type&lt;/p&gt; &lt;ul&gt; &lt;li&gt;bank_account : 銀行口座&lt;/li&gt; &lt;li&gt;credit_card : クレジットカード&lt;/li&gt; &lt;li&gt;wallet : 現金&lt;/li&gt; &lt;li&gt;private_account_item : プライベート資金（法人の場合は役員借入金もしくは役員借入金、個人の場合は事業主貸もしくは事業主借）&lt;/li&gt; &lt;/ul&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;receipt_ids : 証憑ファイルID&lt;/p&gt; &lt;/li&gt; &lt;/ul&gt; &lt;h2 id&#x3D;\&quot;_3\&quot;&gt;注意点&lt;/h2&gt; &lt;ul&gt; &lt;li&gt;本APIでは支払行(payments)の操作ができません。支払行の作成・更新・削除APIをご利用ください。&lt;/li&gt; &lt;li&gt;本APIでは+更新行(renews)の操作ができません。+更新行の作成・更新・削除APIをご利用ください。&lt;/li&gt; &lt;li&gt;本APIでは収入／支出の切替えができません。既存の取引を削除後、再度作成してください。&lt;/li&gt; &lt;li&gt;本APIで取引を更新すると、消費税の計算方法は必ず内税方式が選択されます。&lt;/li&gt; &lt;li&gt;セグメントタグ情報は法人向けのプロフェッショナルプラン以上で利用可能です。利用可能なセグメントの数は、法人向けのプロフェッショナルプランの場合は1つ、エンタープライズプランの場合は3つです。&lt;/li&gt; &lt;li&gt;partner_codeを利用するには、事業所の設定から取引先コードの利用を有効にする必要があります。またpartner_codeとpartner_idは同時に指定することはできません。&lt;/ul&gt;
    # @param id [Integer] 取引ID
    # @param [Hash] opts the optional parameters
    # @option opts [DealUpdateParams] :deal_update_params 取引（収入／支出）の更新
    # @return [Array<(DealResponse, Integer, Hash)>] DealResponse data, response status code and response headers
    def update_deal_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: DealsApi.update_deal ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling DealsApi.update_deal"
      end
      if @api_client.config.client_side_validation && id > 999999999999
        fail ArgumentError, 'invalid value for "id" when calling DealsApi.update_deal, must be smaller than or equal to 999999999999.'
      end

      if @api_client.config.client_side_validation && id < 1
        fail ArgumentError, 'invalid value for "id" when calling DealsApi.update_deal, must be greater than or equal to 1.'
      end

      # resource path
      local_var_path = '/api/1/deals/{id}'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/x-www-form-urlencoded'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] || @api_client.object_to_http_body(opts[:'deal_update_params']) 

      # return_type
      return_type = opts[:return_type] || 'DealResponse' 

      # auth_names
      auth_names = opts[:auth_names] || ['oauth2']

      new_options = opts.merge(
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: DealsApi#update_deal\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end