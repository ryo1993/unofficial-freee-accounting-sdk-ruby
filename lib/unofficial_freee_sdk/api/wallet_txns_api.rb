=begin
#freee API

# <h1 id=\"freee_api\">freee API</h1> <hr /> <h2 id=\"\">スタートガイド</h2>  <p>freee API開発がはじめての方は<a href=\"https://developer.freee.co.jp/getting-started\">freee API スタートガイド</a>を参照してください。</p>  <hr /> <h2 id=\"_2\">仕様</h2>  <h3 id=\"api\">APIエンドポイント</h3>  <p>https://api.freee.co.jp/ (httpsのみ)</p>  <h3 id=\"_3\">認証方式</h3>  <p><a href=\"http://tools.ietf.org/html/rfc6749\">OAuth2</a>に対応</p>  <ul> <li>Authorization Code Flow (Webアプリ向け)</li>  <li>Implicit Flow (Mobileアプリ向け)</li> </ul>  <h3 id=\"_4\">認証エンドポイント</h3>  <p>https://accounts.secure.freee.co.jp/</p>  <ul> <li>authorize : https://accounts.secure.freee.co.jp/public_api/authorize</li>  <li>token : https://accounts.secure.freee.co.jp/public_api/token</li> </ul>  <h3 id=\"_5\">アクセストークンのリフレッシュ</h3>  <p>認証時に得たrefresh_token を使ってtoken の期限をリフレッシュして新規に発行することが出来ます。</p>  <p>grant_type=refresh_token で https://accounts.secure.freee.co.jp/public_api/token にアクセスすればリフレッシュされます。</p>  <p>e.g.)</p>  <p>POST: https://accounts.secure.freee.co.jp/public_api/token</p>  <p>params: grant_type=refresh_token&amp;client_id=UID&amp;client_secret=SECRET&amp;refresh_token=REFRESH_TOKEN</p>  <p>詳細は<a href=\"https://github.com/applicake/doorkeeper/wiki/Enable-Refresh-Token-Credentials#flow\">refresh_token</a>を参照下さい。</p>  <h3 id=\"_6\">アクセストークンの破棄</h3>  <p>認証時に得たaccess_tokenまたはrefresh_tokenを使って、tokenを破棄することができます。 token=access_tokenまたはtoken=refresh_tokenでhttps://accounts.secure.freee.co.jp/public_api/revokeにアクセスすると破棄されます。token_type_hintでaccess_tokenまたはrefresh_tokenを陽に指定できます。</p>  <p>e.g.)</p>  <p>POST: https://accounts.secure.freee.co.jp/public_api/revoke</p>  <p>params: token=ACCESS_TOKEN</p>  <p>または</p>  <p>params: token=REFRESH_TOKEN</p>  <p>または</p>  <p>params: token=ACCESS_TOKEN&amp;token_type_hint=access_token</p>  <p>または</p>  <p>params: token=REFRESH_TOKEN&amp;token_type_hint=refresh_token</p>  <p>詳細は <a href=\"https://tools.ietf.org/html/rfc7009\">OAuth 2.0 Token revocation</a> をご参照ください。</p>  <h3 id=\"_7\">データフォーマット</h3>  <p>リクエスト、レスポンスともにJSON形式をサポート</p>  <h3 id=\"_8\">後方互換性ありの変更</h3>  <p>freeeでは、APIを改善していくために以下のような変更は後方互換性ありとして通知なく変更を入れることがあります。アプリケーション実装者は以下を踏まえて開発を行ってください。</p>  <ul> <li>新しいAPIリソース・エンドポイントの追加</li> <li>既存のAPIに対して必須ではない新しいリクエストパラメータの追加</li> <li>既存のAPIレスポンスに対する新しいプロパティの追加</li> <li>既存のAPIレスポンスに対するプロパティの順番の入れ変え</li> <li>keyとなっているidやcodeの長さの変更（長くする）</li> </ul>  <h3 id=\"_9\">共通レスポンスヘッダー</h3>  <p>すべてのAPIのレスポンスには以下のHTTPヘッダーが含まれます。</p>  <ul> <li> <p>X-Freee-Request-ID</p> <ul> <li>各リクエスト毎に発行されるID</li> </ul> </li> </ul>  <h3 id=\"_10\">共通エラーレスポンス</h3>  <ul> <li> <p>ステータスコードはレスポンス内のJSONに含まれる他、HTTPヘッダにも含まれる</p> </li>  <li> <p>type</p>  <ul> <li>status : HTTPステータスコードの説明</li>  <li>validation : エラーの詳細の説明（開発者向け）</li> </ul> </li> </ul>  <p>レスポンスの例</p>  <pre><code>  {     &quot;status_code&quot; : 400,     &quot;errors&quot; : [       {         &quot;type&quot; : &quot;status&quot;,         &quot;messages&quot; : [&quot;不正なリクエストです。&quot;]       },       {         &quot;type&quot; : &quot;validation&quot;,         &quot;messages&quot; : [&quot;Date は不正な日付フォーマットです。入力例：2013-01-01&quot;]       }     ]   }</code></pre>  </br>  <h3 id=\"_11\">API使用制限</h3>    <p>freeeは一定期間に過度のアクセスを検知した場合、APIアクセスをコントロールする場合があります。</p>   <p>その際のhttp status codeは403となります。制限がかかってから10分程度が過ぎると再度使用することができるようになります。</p>  <h4 id=\"_12\">/reportsエンドポイント</h4>  <p>freeeは/reportsエンドポイントに対して1秒間に10以上のアクセスを検知した場合、APIアクセスをコントロールする場合があります。その際のhttp status codeは429（too many requests）となります。</p>  <p>レスポンスボディのmetaプロパティに以下を含めます。</p>  <ul>   <li>設定されている上限値</li>   <li>上限に達するまでの使用可能回数</li>   <li>（上限値に達した場合）使用回数がリセットされる時刻</li> </ul>  <h3 id=\"_13\">プラン別のAPI Rate Limit</h3>   <table border=\"1\">     <tbody>       <tr>         <th style=\"padding: 10px\"><strong>会計freeeプラン名</strong></th>         <th style=\"padding: 10px\"><strong>事業所とアプリケーション毎に1日でのAPIコール数</strong></th>       </tr>       <tr>         <td style=\"padding: 10px\">エンタープライズ</td>         <td style=\"padding: 10px\">10,000</td>       </tr>       <tr>         <td style=\"padding: 10px\">プロフェッショナル</td>         <td style=\"padding: 10px\">5,000</td>       </tr>       <tr>         <td style=\"padding: 10px\">ベーシック</td>         <td style=\"padding: 10px\">3,000</td>       </tr>       <tr>         <td style=\"padding: 10px\">ミニマム</td>         <td style=\"padding: 10px\">3,000</td>       </tr>       <tr>         <td style=\"padding: 10px\">上記以外</td>         <td style=\"padding: 10px\">3,000</td>       </tr>     </tbody>   </table>  <hr /> <h2 id=\"_14\">連絡先</h2>  <p>ご不明点、ご要望等は <a href=\"https://support.freee.co.jp/hc/ja/requests/new\">freee サポートデスクへのお問い合わせフォーム</a> からご連絡ください。</p> <hr />&copy; Since 2013 freee K.K.

The version of the OpenAPI document: v1.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.2.3

=end

require 'cgi'

module UnofficialFreeeSdk
  class WalletTxnsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # 明細の作成
    #  <h2 id=\"\">概要</h2>  <p>指定した事業所の明細を作成する</p>  <h2 id=\"_2\">定義</h2>  <ul> <li> <p>amount : 明細金額</p> </li>  <li> <p>due_amount : 取引登録待ち金額</p> </li>  <li> <p>balance : 残高</p> </li>  <li> <p>entry_side</p>  <ul> <li>income : 入金</li>  <li>expense : 出金</li> </ul> </li>  <li> <p>walletable_type</p>  <ul> <li>bank_account : 銀行口座</li>  <li>credit_card : クレジットカード</li>  <li>wallet : その他の決済口座</li> </ul> </li> </ul>
    # @param [Hash] opts the optional parameters
    # @option opts [WalletTxnParams] :wallet_txn_params 明細の作成
    # @return [WalletTxnResponse]
    def create_wallet_txn(opts = {})
      data, _status_code, _headers = create_wallet_txn_with_http_info(opts)
      data
    end

    # 明細の作成
    #  &lt;h2 id&#x3D;\&quot;\&quot;&gt;概要&lt;/h2&gt;  &lt;p&gt;指定した事業所の明細を作成する&lt;/p&gt;  &lt;h2 id&#x3D;\&quot;_2\&quot;&gt;定義&lt;/h2&gt;  &lt;ul&gt; &lt;li&gt; &lt;p&gt;amount : 明細金額&lt;/p&gt; &lt;/li&gt;  &lt;li&gt; &lt;p&gt;due_amount : 取引登録待ち金額&lt;/p&gt; &lt;/li&gt;  &lt;li&gt; &lt;p&gt;balance : 残高&lt;/p&gt; &lt;/li&gt;  &lt;li&gt; &lt;p&gt;entry_side&lt;/p&gt;  &lt;ul&gt; &lt;li&gt;income : 入金&lt;/li&gt;  &lt;li&gt;expense : 出金&lt;/li&gt; &lt;/ul&gt; &lt;/li&gt;  &lt;li&gt; &lt;p&gt;walletable_type&lt;/p&gt;  &lt;ul&gt; &lt;li&gt;bank_account : 銀行口座&lt;/li&gt;  &lt;li&gt;credit_card : クレジットカード&lt;/li&gt;  &lt;li&gt;wallet : その他の決済口座&lt;/li&gt; &lt;/ul&gt; &lt;/li&gt; &lt;/ul&gt;
    # @param [Hash] opts the optional parameters
    # @option opts [WalletTxnParams] :wallet_txn_params 明細の作成
    # @return [Array<(WalletTxnResponse, Integer, Hash)>] WalletTxnResponse data, response status code and response headers
    def create_wallet_txn_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: WalletTxnsApi.create_wallet_txn ...'
      end
      # resource path
      local_var_path = '/api/1/wallet_txns'

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
      post_body = opts[:body] || @api_client.object_to_http_body(opts[:'wallet_txn_params']) 

      # return_type
      return_type = opts[:return_type] || 'WalletTxnResponse' 

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
        @api_client.config.logger.debug "API called: WalletTxnsApi#create_wallet_txn\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # 明細の削除
    #  <h2 id=\"\">概要</h2>  <p>指定した事業所の明細を削除する</p>
    # @param id [Integer] 明細ID
    # @param company_id [Integer] 事業所ID
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def destroy_wallet_txn(id, company_id, opts = {})
      destroy_wallet_txn_with_http_info(id, company_id, opts)
      nil
    end

    # 明細の削除
    #  &lt;h2 id&#x3D;\&quot;\&quot;&gt;概要&lt;/h2&gt;  &lt;p&gt;指定した事業所の明細を削除する&lt;/p&gt;
    # @param id [Integer] 明細ID
    # @param company_id [Integer] 事業所ID
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def destroy_wallet_txn_with_http_info(id, company_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: WalletTxnsApi.destroy_wallet_txn ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling WalletTxnsApi.destroy_wallet_txn"
      end
      if @api_client.config.client_side_validation && id > 999999999999
        fail ArgumentError, 'invalid value for "id" when calling WalletTxnsApi.destroy_wallet_txn, must be smaller than or equal to 999999999999.'
      end

      if @api_client.config.client_side_validation && id < 1
        fail ArgumentError, 'invalid value for "id" when calling WalletTxnsApi.destroy_wallet_txn, must be greater than or equal to 1.'
      end

      # verify the required parameter 'company_id' is set
      if @api_client.config.client_side_validation && company_id.nil?
        fail ArgumentError, "Missing the required parameter 'company_id' when calling WalletTxnsApi.destroy_wallet_txn"
      end
      if @api_client.config.client_side_validation && company_id > 4294967295
        fail ArgumentError, 'invalid value for "company_id" when calling WalletTxnsApi.destroy_wallet_txn, must be smaller than or equal to 4294967295.'
      end

      if @api_client.config.client_side_validation && company_id < 1
        fail ArgumentError, 'invalid value for "company_id" when calling WalletTxnsApi.destroy_wallet_txn, must be greater than or equal to 1.'
      end

      # resource path
      local_var_path = '/api/1/wallet_txns/{id}'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

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
        @api_client.config.logger.debug "API called: WalletTxnsApi#destroy_wallet_txn\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # 明細の取得
    #  <h2 id=\"\">概要</h2>  <p>指定した事業所の明細を取得する</p>  <h2 id=\"_2\">定義</h2>  <ul> <li> <p>amount : 明細金額</p> </li>  <li> <p>due_amount : 取引登録待ち金額</p> </li>  <li> <p>balance : 残高</p> </li>  <li> <p>entry_side</p>  <ul> <li>income : 入金</li>  <li>expense : 出金</li> </ul> </li>  <li> <p>walletable_type</p>  <ul> <li>bank_account : 銀行口座</li>  <li>credit_card : クレジットカード</li>  <li>wallet : その他の決済口座</li> </ul> </li> </ul>
    # @param id [Integer] 明細ID
    # @param company_id [Integer] 事業所ID
    # @param [Hash] opts the optional parameters
    # @return [WalletTxnResponse]
    def get_wallet_txn(id, company_id, opts = {})
      data, _status_code, _headers = get_wallet_txn_with_http_info(id, company_id, opts)
      data
    end

    # 明細の取得
    #  &lt;h2 id&#x3D;\&quot;\&quot;&gt;概要&lt;/h2&gt;  &lt;p&gt;指定した事業所の明細を取得する&lt;/p&gt;  &lt;h2 id&#x3D;\&quot;_2\&quot;&gt;定義&lt;/h2&gt;  &lt;ul&gt; &lt;li&gt; &lt;p&gt;amount : 明細金額&lt;/p&gt; &lt;/li&gt;  &lt;li&gt; &lt;p&gt;due_amount : 取引登録待ち金額&lt;/p&gt; &lt;/li&gt;  &lt;li&gt; &lt;p&gt;balance : 残高&lt;/p&gt; &lt;/li&gt;  &lt;li&gt; &lt;p&gt;entry_side&lt;/p&gt;  &lt;ul&gt; &lt;li&gt;income : 入金&lt;/li&gt;  &lt;li&gt;expense : 出金&lt;/li&gt; &lt;/ul&gt; &lt;/li&gt;  &lt;li&gt; &lt;p&gt;walletable_type&lt;/p&gt;  &lt;ul&gt; &lt;li&gt;bank_account : 銀行口座&lt;/li&gt;  &lt;li&gt;credit_card : クレジットカード&lt;/li&gt;  &lt;li&gt;wallet : その他の決済口座&lt;/li&gt; &lt;/ul&gt; &lt;/li&gt; &lt;/ul&gt;
    # @param id [Integer] 明細ID
    # @param company_id [Integer] 事業所ID
    # @param [Hash] opts the optional parameters
    # @return [Array<(WalletTxnResponse, Integer, Hash)>] WalletTxnResponse data, response status code and response headers
    def get_wallet_txn_with_http_info(id, company_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: WalletTxnsApi.get_wallet_txn ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling WalletTxnsApi.get_wallet_txn"
      end
      if @api_client.config.client_side_validation && id > 999999999999
        fail ArgumentError, 'invalid value for "id" when calling WalletTxnsApi.get_wallet_txn, must be smaller than or equal to 999999999999.'
      end

      if @api_client.config.client_side_validation && id < 1
        fail ArgumentError, 'invalid value for "id" when calling WalletTxnsApi.get_wallet_txn, must be greater than or equal to 1.'
      end

      # verify the required parameter 'company_id' is set
      if @api_client.config.client_side_validation && company_id.nil?
        fail ArgumentError, "Missing the required parameter 'company_id' when calling WalletTxnsApi.get_wallet_txn"
      end
      if @api_client.config.client_side_validation && company_id > 4294967295
        fail ArgumentError, 'invalid value for "company_id" when calling WalletTxnsApi.get_wallet_txn, must be smaller than or equal to 4294967295.'
      end

      if @api_client.config.client_side_validation && company_id < 1
        fail ArgumentError, 'invalid value for "company_id" when calling WalletTxnsApi.get_wallet_txn, must be greater than or equal to 1.'
      end

      # resource path
      local_var_path = '/api/1/wallet_txns/{id}'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

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
      return_type = opts[:return_type] || 'WalletTxnResponse' 

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
        @api_client.config.logger.debug "API called: WalletTxnsApi#get_wallet_txn\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # 明細一覧の取得
    #  <h2 id=\"\">概要</h2>  <p>指定した事業所の明細一覧を取得する</p>  <h2 id=\"_2\">定義</h2>  <ul> <li> <p>amount : 明細金額</p> </li>  <li> <p>due_amount : 取引登録待ち金額</p> </li>  <li> <p>balance : 残高</p> </li>  <li> <p>entry_side</p>  <ul> <li>income : 入金</li>  <li>expense : 出金</li> </ul> </li>  <li> <p>walletable_type</p>  <ul> <li>bank_account : 銀行口座</li>  <li>credit_card : クレジットカード</li>  <li>wallet : その他の決済口座</li> </ul> </li> </ul>
    # @param company_id [Integer] 事業所ID
    # @param [Hash] opts the optional parameters
    # @option opts [String] :walletable_type 口座区分 (銀行口座: bank_account, クレジットカード: credit_card, 現金: wallet)
    # @option opts [Integer] :walletable_id 口座ID
    # @option opts [String] :start_date 取引日で絞込：開始日 (yyyy-mm-dd)
    # @option opts [String] :end_date 取引日で絞込：終了日 (yyyy-mm-dd)
    # @option opts [String] :entry_side 入金／出金 (入金: income, 出金: expense)
    # @option opts [Integer] :offset 取得レコードのオフセット (デフォルト: 0)
    # @option opts [Integer] :limit 取得レコードの件数 (デフォルト: 20, 最小: 1, 最大: 100) 
    # @return [InlineResponse20015]
    def get_wallet_txns(company_id, opts = {})
      data, _status_code, _headers = get_wallet_txns_with_http_info(company_id, opts)
      data
    end

    # 明細一覧の取得
    #  &lt;h2 id&#x3D;\&quot;\&quot;&gt;概要&lt;/h2&gt;  &lt;p&gt;指定した事業所の明細一覧を取得する&lt;/p&gt;  &lt;h2 id&#x3D;\&quot;_2\&quot;&gt;定義&lt;/h2&gt;  &lt;ul&gt; &lt;li&gt; &lt;p&gt;amount : 明細金額&lt;/p&gt; &lt;/li&gt;  &lt;li&gt; &lt;p&gt;due_amount : 取引登録待ち金額&lt;/p&gt; &lt;/li&gt;  &lt;li&gt; &lt;p&gt;balance : 残高&lt;/p&gt; &lt;/li&gt;  &lt;li&gt; &lt;p&gt;entry_side&lt;/p&gt;  &lt;ul&gt; &lt;li&gt;income : 入金&lt;/li&gt;  &lt;li&gt;expense : 出金&lt;/li&gt; &lt;/ul&gt; &lt;/li&gt;  &lt;li&gt; &lt;p&gt;walletable_type&lt;/p&gt;  &lt;ul&gt; &lt;li&gt;bank_account : 銀行口座&lt;/li&gt;  &lt;li&gt;credit_card : クレジットカード&lt;/li&gt;  &lt;li&gt;wallet : その他の決済口座&lt;/li&gt; &lt;/ul&gt; &lt;/li&gt; &lt;/ul&gt;
    # @param company_id [Integer] 事業所ID
    # @param [Hash] opts the optional parameters
    # @option opts [String] :walletable_type 口座区分 (銀行口座: bank_account, クレジットカード: credit_card, 現金: wallet)
    # @option opts [Integer] :walletable_id 口座ID
    # @option opts [String] :start_date 取引日で絞込：開始日 (yyyy-mm-dd)
    # @option opts [String] :end_date 取引日で絞込：終了日 (yyyy-mm-dd)
    # @option opts [String] :entry_side 入金／出金 (入金: income, 出金: expense)
    # @option opts [Integer] :offset 取得レコードのオフセット (デフォルト: 0)
    # @option opts [Integer] :limit 取得レコードの件数 (デフォルト: 20, 最小: 1, 最大: 100) 
    # @return [Array<(InlineResponse20015, Integer, Hash)>] InlineResponse20015 data, response status code and response headers
    def get_wallet_txns_with_http_info(company_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: WalletTxnsApi.get_wallet_txns ...'
      end
      # verify the required parameter 'company_id' is set
      if @api_client.config.client_side_validation && company_id.nil?
        fail ArgumentError, "Missing the required parameter 'company_id' when calling WalletTxnsApi.get_wallet_txns"
      end
      if @api_client.config.client_side_validation && company_id > 4294967295
        fail ArgumentError, 'invalid value for "company_id" when calling WalletTxnsApi.get_wallet_txns, must be smaller than or equal to 4294967295.'
      end

      if @api_client.config.client_side_validation && company_id < 1
        fail ArgumentError, 'invalid value for "company_id" when calling WalletTxnsApi.get_wallet_txns, must be greater than or equal to 1.'
      end

      allowable_values = ["bank_account", "credit_card", "wallet"]
      if @api_client.config.client_side_validation && opts[:'walletable_type'] && !allowable_values.include?(opts[:'walletable_type'])
        fail ArgumentError, "invalid value for \"walletable_type\", must be one of #{allowable_values}"
      end
      if @api_client.config.client_side_validation && !opts[:'walletable_id'].nil? && opts[:'walletable_id'] > 999999999999
        fail ArgumentError, 'invalid value for "opts[:"walletable_id"]" when calling WalletTxnsApi.get_wallet_txns, must be smaller than or equal to 999999999999.'
      end

      if @api_client.config.client_side_validation && !opts[:'walletable_id'].nil? && opts[:'walletable_id'] < 1
        fail ArgumentError, 'invalid value for "opts[:"walletable_id"]" when calling WalletTxnsApi.get_wallet_txns, must be greater than or equal to 1.'
      end

      allowable_values = ["income", "expense"]
      if @api_client.config.client_side_validation && opts[:'entry_side'] && !allowable_values.include?(opts[:'entry_side'])
        fail ArgumentError, "invalid value for \"entry_side\", must be one of #{allowable_values}"
      end
      if @api_client.config.client_side_validation && !opts[:'offset'].nil? && opts[:'offset'] > 9223372036854775807
        fail ArgumentError, 'invalid value for "opts[:"offset"]" when calling WalletTxnsApi.get_wallet_txns, must be smaller than or equal to 9223372036854775807.'
      end

      if @api_client.config.client_side_validation && !opts[:'offset'].nil? && opts[:'offset'] < 0
        fail ArgumentError, 'invalid value for "opts[:"offset"]" when calling WalletTxnsApi.get_wallet_txns, must be greater than or equal to 0.'
      end

      if @api_client.config.client_side_validation && !opts[:'limit'].nil? && opts[:'limit'] > 100
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling WalletTxnsApi.get_wallet_txns, must be smaller than or equal to 100.'
      end

      if @api_client.config.client_side_validation && !opts[:'limit'].nil? && opts[:'limit'] < 1
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling WalletTxnsApi.get_wallet_txns, must be greater than or equal to 1.'
      end

      # resource path
      local_var_path = '/api/1/wallet_txns'

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'company_id'] = company_id
      query_params[:'walletable_type'] = opts[:'walletable_type'] if !opts[:'walletable_type'].nil?
      query_params[:'walletable_id'] = opts[:'walletable_id'] if !opts[:'walletable_id'].nil?
      query_params[:'start_date'] = opts[:'start_date'] if !opts[:'start_date'].nil?
      query_params[:'end_date'] = opts[:'end_date'] if !opts[:'end_date'].nil?
      query_params[:'entry_side'] = opts[:'entry_side'] if !opts[:'entry_side'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body] 

      # return_type
      return_type = opts[:return_type] || 'InlineResponse20015' 

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
        @api_client.config.logger.debug "API called: WalletTxnsApi#get_wallet_txns\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
