=begin
#freee API

# <h1 id=\"freee_api\">freee API</h1> <hr /> <h2 id=\"\">スタートガイド</h2>  <p>freee API開発がはじめての方は<a href=\"https://developer.freee.co.jp/getting-started\">freee API スタートガイド</a>を参照してください。</p>  <hr /> <h2 id=\"_2\">仕様</h2>  <h3 id=\"api\">APIエンドポイント</h3>  <p>https://api.freee.co.jp/ (httpsのみ)</p>  <h3 id=\"_3\">認証方式</h3>  <p><a href=\"http://tools.ietf.org/html/rfc6749\">OAuth2</a>に対応</p>  <ul> <li>Authorization Code Flow (Webアプリ向け)</li>  <li>Implicit Flow (Mobileアプリ向け)</li> </ul>  <h3 id=\"_4\">認証エンドポイント</h3>  <p>https://accounts.secure.freee.co.jp/</p>  <ul> <li>authorize : https://accounts.secure.freee.co.jp/public_api/authorize</li>  <li>token : https://accounts.secure.freee.co.jp/public_api/token</li> </ul>  <h3 id=\"_5\">アクセストークンのリフレッシュ</h3>  <p>認証時に得たrefresh_token を使ってtoken の期限をリフレッシュして新規に発行することが出来ます。</p>  <p>grant_type=refresh_token で https://accounts.secure.freee.co.jp/public_api/token にアクセスすればリフレッシュされます。</p>  <p>e.g.)</p>  <p>POST: https://accounts.secure.freee.co.jp/public_api/token</p>  <p>params: grant_type=refresh_token&amp;client_id=UID&amp;client_secret=SECRET&amp;refresh_token=REFRESH_TOKEN</p>  <p>詳細は<a href=\"https://github.com/applicake/doorkeeper/wiki/Enable-Refresh-Token-Credentials#flow\">refresh_token</a>を参照下さい。</p>  <h3 id=\"_6\">アクセストークンの破棄</h3>  <p>認証時に得たaccess_tokenまたはrefresh_tokenを使って、tokenを破棄することができます。 token=access_tokenまたはtoken=refresh_tokenでhttps://accounts.secure.freee.co.jp/public_api/revokeにアクセスすると破棄されます。token_type_hintでaccess_tokenまたはrefresh_tokenを陽に指定できます。</p>  <p>e.g.)</p>  <p>POST: https://accounts.secure.freee.co.jp/public_api/revoke</p>  <p>params: token=ACCESS_TOKEN</p>  <p>または</p>  <p>params: token=REFRESH_TOKEN</p>  <p>または</p>  <p>params: token=ACCESS_TOKEN&amp;token_type_hint=access_token</p>  <p>または</p>  <p>params: token=REFRESH_TOKEN&amp;token_type_hint=refresh_token</p>  <p>詳細は <a href=\"https://tools.ietf.org/html/rfc7009\">OAuth 2.0 Token revocation</a> をご参照ください。</p>  <h3 id=\"_7\">データフォーマット</h3>  <p>リクエスト、レスポンスともにJSON形式をサポート</p>  <h3 id=\"_8\">後方互換性ありの変更</h3>  <p>freeeでは、APIを改善していくために以下のような変更は後方互換性ありとして通知なく変更を入れることがあります。アプリケーション実装者は以下を踏まえて開発を行ってください。</p>  <ul> <li>新しいAPIリソース・エンドポイントの追加</li> <li>既存のAPIに対して必須ではない新しいリクエストパラメータの追加</li> <li>既存のAPIレスポンスに対する新しいプロパティの追加</li> <li>既存のAPIレスポンスに対するプロパティの順番の入れ変え</li> <li>keyとなっているidやcodeの長さの変更（長くする）</li> </ul>  <h3 id=\"_9\">共通レスポンスヘッダー</h3>  <p>すべてのAPIのレスポンスには以下のHTTPヘッダーが含まれます。</p>  <ul> <li> <p>X-Freee-Request-ID</p> <ul> <li>各リクエスト毎に発行されるID</li> </ul> </li> </ul>  <h3 id=\"_10\">共通エラーレスポンス</h3>  <ul> <li> <p>ステータスコードはレスポンス内のJSONに含まれる他、HTTPヘッダにも含まれる</p> </li>  <li> <p>type</p>  <ul> <li>status : HTTPステータスコードの説明</li>  <li>validation : エラーの詳細の説明（開発者向け）</li> </ul> </li> </ul>  <p>レスポンスの例</p>  <pre><code>  {     &quot;status_code&quot; : 400,     &quot;errors&quot; : [       {         &quot;type&quot; : &quot;status&quot;,         &quot;messages&quot; : [&quot;不正なリクエストです。&quot;]       },       {         &quot;type&quot; : &quot;validation&quot;,         &quot;messages&quot; : [&quot;Date は不正な日付フォーマットです。入力例：2013-01-01&quot;]       }     ]   }</code></pre>  </br>  <h3 id=\"_11\">API使用制限</h3>    <p>freeeは一定期間に過度のアクセスを検知した場合、APIアクセスをコントロールする場合があります。</p>   <p>その際のhttp status codeは403となります。制限がかかってから10分程度が過ぎると再度使用することができるようになります。</p>  <h4 id=\"_12\">/reportsエンドポイント</h4>  <p>freeeは/reportsエンドポイントに対して1秒間に10以上のアクセスを検知した場合、APIアクセスをコントロールする場合があります。その際のhttp status codeは429（too many requests）となります。</p>  <p>レスポンスボディのmetaプロパティに以下を含めます。</p>  <ul>   <li>設定されている上限値</li>   <li>上限に達するまでの使用可能回数</li>   <li>（上限値に達した場合）使用回数がリセットされる時刻</li> </ul>  <h3 id=\"_13\">プラン別のAPI Rate Limit</h3>   <table border=\"1\">     <tbody>       <tr>         <th style=\"padding: 10px\"><strong>会計freeeプラン名</strong></th>         <th style=\"padding: 10px\"><strong>事業所とアプリケーション毎に1日でのAPIコール数</strong></th>       </tr>       <tr>         <td style=\"padding: 10px\">エンタープライズ</td>         <td style=\"padding: 10px\">10,000</td>       </tr>       <tr>         <td style=\"padding: 10px\">プロフェッショナル</td>         <td style=\"padding: 10px\">5,000</td>       </tr>       <tr>         <td style=\"padding: 10px\">ベーシック</td>         <td style=\"padding: 10px\">3,000</td>       </tr>       <tr>         <td style=\"padding: 10px\">ミニマム</td>         <td style=\"padding: 10px\">3,000</td>       </tr>       <tr>         <td style=\"padding: 10px\">上記以外</td>         <td style=\"padding: 10px\">3,000</td>       </tr>     </tbody>   </table>  <hr /> <h2 id=\"_14\">連絡先</h2>  <p>ご不明点、ご要望等は <a href=\"https://support.freee.co.jp/hc/ja/requests/new\">freee サポートデスクへのお問い合わせフォーム</a> からご連絡ください。</p> <hr />&copy; Since 2013 freee K.K.

The version of the OpenAPI document: v1.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.2.3

=end

require 'spec_helper'
require 'json'

# Unit tests for UnofficialFreeeSdk::SectionsApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'SectionsApi' do
  before do
    # run before each test
    @api_instance = UnofficialFreeeSdk::SectionsApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of SectionsApi' do
    it 'should create an instance of SectionsApi' do
      expect(@api_instance).to be_instance_of(UnofficialFreeeSdk::SectionsApi)
    end
  end

  # unit tests for create_section
  # 部門の作成
  #  &lt;h2 id&#x3D;\&quot;\&quot;&gt;概要&lt;/h2&gt;  &lt;p&gt;指定した事業所の部門を作成する&lt;/p&gt;  &lt;h2 id&#x3D;\&quot;_2\&quot;&gt;レスポンスの例&lt;/h2&gt;  &lt;pre&gt;&lt;code&gt;// プレミアムプラン（個人）、ビジネスプラン（法人）、エンタープライズプラン（法人） {   &amp;quot;section&amp;quot; : {     &amp;quot;id&amp;quot; : 102,     &amp;quot;company_id&amp;quot; : 1,     &amp;quot;name&amp;quot; : &amp;quot;開発部門&amp;quot;,     &amp;quot;shortcut1&amp;quot; : &amp;quot;DEVELOPER&amp;quot;,     &amp;quot;shortcut2&amp;quot; : &amp;quot;123&amp;quot;,     &amp;quot;indent_count&amp;quot;: 1,     &amp;quot;parent_id&amp;quot;: 101   } } // それ以外のプラン {   &amp;quot;section&amp;quot; : {     &amp;quot;id&amp;quot; : 102,     &amp;quot;company_id&amp;quot; : 1,     &amp;quot;name&amp;quot; : &amp;quot;開発部門&amp;quot;,     &amp;quot;shortcut1&amp;quot; : &amp;quot;DEVELOPER&amp;quot;,     &amp;quot;shortcut2&amp;quot; : &amp;quot;123&amp;quot;   } }&lt;/code&gt;&lt;/pre&gt; 
  # @param [Hash] opts the optional parameters
  # @option opts [SectionParams] :section_params 部門の作成
  # @return [SectionResponse]
  describe 'create_section test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for destroy_section
  # 部門の削除
  #  &lt;h2 id&#x3D;\&quot;\&quot;&gt;概要&lt;/h2&gt;  &lt;p&gt;指定した事業所の部門を削除する&lt;/p&gt;
  # @param id 
  # @param company_id 事業所ID
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'destroy_section test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_section
  #  &lt;h2 id&#x3D;\&quot;\&quot;&gt;概要&lt;/h2&gt;  &lt;p&gt;指定した事業所の部門を参照する&lt;/p&gt;&lt;h2 id&#x3D;\&quot;_2\&quot;&gt;レスポンスの例&lt;/h2&gt;  &lt;pre&gt;&lt;code&gt;// プレミアムプラン（個人）、ビジネスプラン（法人）、エンタープライズプラン（法人） {   &amp;quot;section&amp;quot; : {     &amp;quot;id&amp;quot; : 102,     &amp;quot;company_id&amp;quot; : 1,     &amp;quot;name&amp;quot; : &amp;quot;開発部門&amp;quot;,     &amp;quot;long_name&amp;quot;: &amp;quot;開発部門&amp;quot;,     &amp;quot;shortcut1&amp;quot; : &amp;quot;DEVELOPER&amp;quot;,     &amp;quot;shortcut2&amp;quot; : &amp;quot;123&amp;quot;,     &amp;quot;indent_count&amp;quot;: 1,     &amp;quot;parent_id&amp;quot;: 101   } } // それ以外のプラン {   &amp;quot;section&amp;quot; : {     &amp;quot;id&amp;quot; : 102,     &amp;quot;company_id&amp;quot; : 1,     &amp;quot;name&amp;quot; : &amp;quot;開発部門&amp;quot;,     &amp;quot;long_name&amp;quot;: &amp;quot;開発部門&amp;quot;,     &amp;quot;shortcut1&amp;quot; : &amp;quot;DEVELOPER&amp;quot;,     &amp;quot;shortcut2&amp;quot; : &amp;quot;123&amp;quot;   } }&lt;/code&gt;&lt;/pre&gt; 
  # @param id 部門ID
  # @param company_id 事業所ID
  # @param [Hash] opts the optional parameters
  # @return [SectionResponse]
  describe 'get_section test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_sections
  # 部門一覧の取得
  #  &lt;h2 id&#x3D;\&quot;\&quot;&gt;概要&lt;/h2&gt;  &lt;p&gt;指定した事業所の部門一覧を取得する&lt;/p&gt;  &lt;h2 id&#x3D;\&quot;_2\&quot;&gt;レスポンスの例&lt;/h2&gt;  &lt;blockquote&gt; &lt;p&gt;GET https://api.freee.co.jp/api/1/sections?company_id&#x3D;1&lt;/p&gt; &lt;/blockquote&gt;  &lt;pre&gt;&lt;code&gt;// プレミアムプラン（個人）、ビジネスプラン（法人）、エンタープライズプラン（法人） {   &amp;quot;sections&amp;quot; : [     {       &amp;quot;id&amp;quot; : 101,       &amp;quot;company_id&amp;quot; : 1,       &amp;quot;name&amp;quot; : &amp;quot;開発部門&amp;quot;,       &amp;quot;long_name&amp;quot;: &amp;quot;開発部門&amp;quot;,       &amp;quot;shortcut1&amp;quot; : &amp;quot;DEVELOPER&amp;quot;,       &amp;quot;shortcut2&amp;quot; : &amp;quot;123&amp;quot;,       &amp;quot;indent_count&amp;quot;: 1,       &amp;quot;parent_id&amp;quot;: 11     },     ...   ] } // それ以外のプラン {   &amp;quot;sections&amp;quot; : [     {       &amp;quot;id&amp;quot; : 101,       &amp;quot;company_id&amp;quot; : 1,       &amp;quot;name&amp;quot; : &amp;quot;開発部門&amp;quot;,       &amp;quot;long_name&amp;quot;: &amp;quot;開発部門&amp;quot;,       &amp;quot;shortcut1&amp;quot; : &amp;quot;DEVELOPER&amp;quot;,       &amp;quot;shortcut2&amp;quot; : &amp;quot;123&amp;quot;     },     ...   ] }&lt;/code&gt;&lt;/pre&gt; 
  # @param company_id 事業所ID
  # @param [Hash] opts the optional parameters
  # @return [InlineResponse2002]
  describe 'get_sections test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for update_section
  # 部門の更新
  #  &lt;h2 id&#x3D;\&quot;\&quot;&gt;概要&lt;/h2&gt;  &lt;p&gt;指定した事業所の部門を更新する&lt;/p&gt;&lt;h2 id&#x3D;\&quot;_2\&quot;&gt;レスポンスの例&lt;/h2&gt;  &lt;pre&gt;&lt;code&gt;// プレミアムプラン（個人）、ビジネスプラン（法人）、エンタープライズプラン（法人） {   &amp;quot;section&amp;quot; : {     &amp;quot;id&amp;quot; : 102,     &amp;quot;company_id&amp;quot; : 1,     &amp;quot;name&amp;quot; : &amp;quot;開発部門&amp;quot;,     &amp;quot;long_name&amp;quot;: &amp;quot;開発部門&amp;quot;,     &amp;quot;shortcut1&amp;quot; : &amp;quot;DEVELOPER&amp;quot;,     &amp;quot;shortcut2&amp;quot; : &amp;quot;123&amp;quot;,     &amp;quot;indent_count&amp;quot;: 1,     &amp;quot;parent_id&amp;quot;: 101   } } // それ以外のプラン {   &amp;quot;section&amp;quot; : {     &amp;quot;id&amp;quot; : 102,     &amp;quot;company_id&amp;quot; : 1,     &amp;quot;name&amp;quot; : &amp;quot;開発部門&amp;quot;,     &amp;quot;long_name&amp;quot;: &amp;quot;開発部門&amp;quot;,     &amp;quot;shortcut1&amp;quot; : &amp;quot;DEVELOPER&amp;quot;,     &amp;quot;shortcut2&amp;quot; : &amp;quot;123&amp;quot;   } }&lt;/code&gt;&lt;/pre&gt; 
  # @param id 
  # @param [Hash] opts the optional parameters
  # @option opts [SectionParams] :section_params 部門の更新
  # @return [SectionResponse]
  describe 'update_section test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end