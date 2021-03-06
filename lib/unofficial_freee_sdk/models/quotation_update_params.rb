=begin
#freee API

# <h1 id=\"freee_api\">freee API</h1> <hr /> <h2 id=\"\">スタートガイド</h2>  <p>freee API開発がはじめての方は<a href=\"https://developer.freee.co.jp/getting-started\">freee API スタートガイド</a>を参照してください。</p>  <hr /> <h2 id=\"_2\">仕様</h2>  <h3 id=\"api\">APIエンドポイント</h3>  <p>https://api.freee.co.jp/ (httpsのみ)</p>  <h3 id=\"_3\">認証方式</h3>  <p><a href=\"http://tools.ietf.org/html/rfc6749\">OAuth2</a>に対応</p>  <ul> <li>Authorization Code Flow (Webアプリ向け)</li>  <li>Implicit Flow (Mobileアプリ向け)</li> </ul>  <h3 id=\"_4\">認証エンドポイント</h3>  <p>https://accounts.secure.freee.co.jp/</p>  <ul> <li>authorize : https://accounts.secure.freee.co.jp/public_api/authorize</li>  <li>token : https://accounts.secure.freee.co.jp/public_api/token</li> </ul>  <h3 id=\"_5\">アクセストークンのリフレッシュ</h3>  <p>認証時に得たrefresh_token を使ってtoken の期限をリフレッシュして新規に発行することが出来ます。</p>  <p>grant_type=refresh_token で https://accounts.secure.freee.co.jp/public_api/token にアクセスすればリフレッシュされます。</p>  <p>e.g.)</p>  <p>POST: https://accounts.secure.freee.co.jp/public_api/token</p>  <p>params: grant_type=refresh_token&amp;client_id=UID&amp;client_secret=SECRET&amp;refresh_token=REFRESH_TOKEN</p>  <p>詳細は<a href=\"https://github.com/applicake/doorkeeper/wiki/Enable-Refresh-Token-Credentials#flow\">refresh_token</a>を参照下さい。</p>  <h3 id=\"_6\">アクセストークンの破棄</h3>  <p>認証時に得たaccess_tokenまたはrefresh_tokenを使って、tokenを破棄することができます。 token=access_tokenまたはtoken=refresh_tokenでhttps://accounts.secure.freee.co.jp/public_api/revokeにアクセスすると破棄されます。token_type_hintでaccess_tokenまたはrefresh_tokenを陽に指定できます。</p>  <p>e.g.)</p>  <p>POST: https://accounts.secure.freee.co.jp/public_api/revoke</p>  <p>params: token=ACCESS_TOKEN</p>  <p>または</p>  <p>params: token=REFRESH_TOKEN</p>  <p>または</p>  <p>params: token=ACCESS_TOKEN&amp;token_type_hint=access_token</p>  <p>または</p>  <p>params: token=REFRESH_TOKEN&amp;token_type_hint=refresh_token</p>  <p>詳細は <a href=\"https://tools.ietf.org/html/rfc7009\">OAuth 2.0 Token revocation</a> をご参照ください。</p>  <h3 id=\"_7\">データフォーマット</h3>  <p>リクエスト、レスポンスともにJSON形式をサポート</p>  <h3 id=\"_8\">後方互換性ありの変更</h3>  <p>freeeでは、APIを改善していくために以下のような変更は後方互換性ありとして通知なく変更を入れることがあります。アプリケーション実装者は以下を踏まえて開発を行ってください。</p>  <ul> <li>新しいAPIリソース・エンドポイントの追加</li> <li>既存のAPIに対して必須ではない新しいリクエストパラメータの追加</li> <li>既存のAPIレスポンスに対する新しいプロパティの追加</li> <li>既存のAPIレスポンスに対するプロパティの順番の入れ変え</li> <li>keyとなっているidやcodeの長さの変更（長くする）</li> </ul>  <h3 id=\"_9\">共通レスポンスヘッダー</h3>  <p>すべてのAPIのレスポンスには以下のHTTPヘッダーが含まれます。</p>  <ul> <li> <p>X-Freee-Request-ID</p> <ul> <li>各リクエスト毎に発行されるID</li> </ul> </li> </ul>  <h3 id=\"_10\">共通エラーレスポンス</h3>  <ul> <li> <p>ステータスコードはレスポンス内のJSONに含まれる他、HTTPヘッダにも含まれる</p> </li>  <li> <p>type</p>  <ul> <li>status : HTTPステータスコードの説明</li>  <li>validation : エラーの詳細の説明（開発者向け）</li> </ul> </li> </ul>  <p>レスポンスの例</p>  <pre><code>  {     &quot;status_code&quot; : 400,     &quot;errors&quot; : [       {         &quot;type&quot; : &quot;status&quot;,         &quot;messages&quot; : [&quot;不正なリクエストです。&quot;]       },       {         &quot;type&quot; : &quot;validation&quot;,         &quot;messages&quot; : [&quot;Date は不正な日付フォーマットです。入力例：2013-01-01&quot;]       }     ]   }</code></pre>  </br>  <h3 id=\"_11\">API使用制限</h3>    <p>freeeは一定期間に過度のアクセスを検知した場合、APIアクセスをコントロールする場合があります。</p>   <p>その際のhttp status codeは403となります。制限がかかってから10分程度が過ぎると再度使用することができるようになります。</p>  <h4 id=\"_12\">/reportsエンドポイント</h4>  <p>freeeは/reportsエンドポイントに対して1秒間に10以上のアクセスを検知した場合、APIアクセスをコントロールする場合があります。その際のhttp status codeは429（too many requests）となります。</p>  <p>レスポンスボディのmetaプロパティに以下を含めます。</p>  <ul>   <li>設定されている上限値</li>   <li>上限に達するまでの使用可能回数</li>   <li>（上限値に達した場合）使用回数がリセットされる時刻</li> </ul>  <h3 id=\"_13\">プラン別のAPI Rate Limit</h3>   <table border=\"1\">     <tbody>       <tr>         <th style=\"padding: 10px\"><strong>会計freeeプラン名</strong></th>         <th style=\"padding: 10px\"><strong>事業所とアプリケーション毎に1日でのAPIコール数</strong></th>       </tr>       <tr>         <td style=\"padding: 10px\">エンタープライズ</td>         <td style=\"padding: 10px\">10,000</td>       </tr>       <tr>         <td style=\"padding: 10px\">プロフェッショナル</td>         <td style=\"padding: 10px\">5,000</td>       </tr>       <tr>         <td style=\"padding: 10px\">ベーシック</td>         <td style=\"padding: 10px\">3,000</td>       </tr>       <tr>         <td style=\"padding: 10px\">ミニマム</td>         <td style=\"padding: 10px\">3,000</td>       </tr>       <tr>         <td style=\"padding: 10px\">上記以外</td>         <td style=\"padding: 10px\">3,000</td>       </tr>     </tbody>   </table>  <hr /> <h2 id=\"_14\">連絡先</h2>  <p>ご不明点、ご要望等は <a href=\"https://support.freee.co.jp/hc/ja/requests/new\">freee サポートデスクへのお問い合わせフォーム</a> からご連絡ください。</p> <hr />&copy; Since 2013 freee K.K.

The version of the OpenAPI document: v1.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.2.3

=end

require 'date'

module UnofficialFreeeSdk
  class QuotationUpdateParams
    # 事業所ID
    attr_accessor :company_id

    # 見積日 (yyyy-mm-dd)
    attr_accessor :issue_date

    # 取引先ID
    attr_accessor :partner_id

    # 取引先コード
    attr_accessor :partner_code

    # 見積書番号 (デフォルト: 自動採番されます)
    attr_accessor :quotation_number

    # タイトル (デフォルト: 見積書)
    attr_accessor :title

    # 概要
    attr_accessor :description

    # 見積書ステータス  (unsubmitted: 送付待ち, submitted: 送付済み)
    attr_accessor :quotation_status

    # 見積書に表示する取引先名
    attr_accessor :partner_display_name

    # 敬称（御中、様、(空白)の3つから選択）
    attr_accessor :partner_title

    # 取引先担当者名
    attr_accessor :partner_contact_info

    # 取引先郵便番号 (デフォルトはpartner_idもしくははpartner_codeで指定された取引先設定情報が補完されます)
    attr_accessor :partner_zipcode

    # 取引先都道府県コード（0:北海道、1:青森、2:岩手、3:宮城、4:秋田、5:山形、6:福島、7:茨城、8:栃木、9:群馬、10:埼玉、11:千葉、12:東京、13:神奈川、14:新潟、15:富山、16:石川、17:福井、18:山梨、19:長野、20:岐阜、21:静岡、22:愛知、23:三重、24:滋賀、25:京都、26:大阪、27:兵庫、28:奈良、29:和歌山、30:鳥取、31:島根、32:岡山、33:広島、34:山口、35:徳島、36:香川、37:愛媛、38:高知、39:福岡、40:佐賀、41:長崎、42:熊本、43:大分、44:宮崎、45:鹿児島、46:沖縄) (デフォルトはpartner_idもしくはpartner_codeで指定された取引先設定情報が補完されます)
    attr_accessor :partner_prefecture_code

    # 取引先市区町村・番地 (デフォルトはpartner_idもしくははpartner_codeで指定された取引先設定情報が補完されます)
    attr_accessor :partner_address1

    # 取引先建物名・部屋番号など (デフォルトはpartner_idもしくははpartner_codeで指定された取引先設定情報が補完されます)
    attr_accessor :partner_address2

    # 事業所名 (デフォルトは事業所設定情報が補完されます)
    attr_accessor :company_name

    # 郵便番号 (デフォルトは事業所設定情報が補完されます)
    attr_accessor :company_zipcode

    # 都道府県コード（0:北海道、1:青森、2:岩手、3:宮城、4:秋田、5:山形、6:福島、7:茨城、8:栃木、9:群馬、10:埼玉、11:千葉、12:東京、13:神奈川、14:新潟、15:富山、16:石川、17:福井、18:山梨、19:長野、20:岐阜、21:静岡、22:愛知、23:三重、24:滋賀、25:京都、26:大阪、27:兵庫、28:奈良、29:和歌山、30:鳥取、31:島根、32:岡山、33:広島、34:山口、35:徳島、36:香川、37:愛媛、38:高知、39:福岡、40:佐賀、41:長崎、42:熊本、43:大分、44:宮崎、45:鹿児島、46:沖縄) (デフォルトは事業所設定情報が補完されます)
    attr_accessor :company_prefecture_code

    # 市区町村・番地 (デフォルトは事業所設定情報が補完されます)
    attr_accessor :company_address1

    # 建物名・部屋番号など (デフォルトは事業所設定情報が補完されます)
    attr_accessor :company_address2

    # 事業所担当者名 (デフォルトは事業所設定情報が補完されます)
    attr_accessor :company_contact_info

    # メッセージ (デフォルト: 下記の通り御見積申し上げます。)
    attr_accessor :message

    # 備考
    attr_accessor :notes

    # レイアウト(default_classic: レイアウト１/クラシック (デフォルト), standard_classic: レイアウト２/クラシック, envelope_classic: 封筒１/クラシック, default_modern: レイアウト１/モダン, standard_modern: レイアウト２/モダン, envelope_modern: 封筒/モダン)
    attr_accessor :quotation_layout

    # 見積書の消費税計算方法(inclusive: 内税表示, exclusive: 外税表示 (デフォルト))
    attr_accessor :tax_entry_method

    # 見積内容
    attr_accessor :quotation_contents

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'company_id' => :'company_id',
        :'issue_date' => :'issue_date',
        :'partner_id' => :'partner_id',
        :'partner_code' => :'partner_code',
        :'quotation_number' => :'quotation_number',
        :'title' => :'title',
        :'description' => :'description',
        :'quotation_status' => :'quotation_status',
        :'partner_display_name' => :'partner_display_name',
        :'partner_title' => :'partner_title',
        :'partner_contact_info' => :'partner_contact_info',
        :'partner_zipcode' => :'partner_zipcode',
        :'partner_prefecture_code' => :'partner_prefecture_code',
        :'partner_address1' => :'partner_address1',
        :'partner_address2' => :'partner_address2',
        :'company_name' => :'company_name',
        :'company_zipcode' => :'company_zipcode',
        :'company_prefecture_code' => :'company_prefecture_code',
        :'company_address1' => :'company_address1',
        :'company_address2' => :'company_address2',
        :'company_contact_info' => :'company_contact_info',
        :'message' => :'message',
        :'notes' => :'notes',
        :'quotation_layout' => :'quotation_layout',
        :'tax_entry_method' => :'tax_entry_method',
        :'quotation_contents' => :'quotation_contents'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'company_id' => :'Integer',
        :'issue_date' => :'String',
        :'partner_id' => :'Integer',
        :'partner_code' => :'String',
        :'quotation_number' => :'String',
        :'title' => :'String',
        :'description' => :'String',
        :'quotation_status' => :'String',
        :'partner_display_name' => :'String',
        :'partner_title' => :'String',
        :'partner_contact_info' => :'String',
        :'partner_zipcode' => :'String',
        :'partner_prefecture_code' => :'Integer',
        :'partner_address1' => :'String',
        :'partner_address2' => :'String',
        :'company_name' => :'String',
        :'company_zipcode' => :'String',
        :'company_prefecture_code' => :'Integer',
        :'company_address1' => :'String',
        :'company_address2' => :'String',
        :'company_contact_info' => :'String',
        :'message' => :'String',
        :'notes' => :'String',
        :'quotation_layout' => :'String',
        :'tax_entry_method' => :'String',
        :'quotation_contents' => :'Array<QuotationUpdateParamsQuotationContents>'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'partner_id',
        :'partner_code',
        :'partner_contact_info',
        :'partner_zipcode',
        :'partner_prefecture_code',
        :'partner_address1',
        :'partner_address2',
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `UnofficialFreeeSdk::QuotationUpdateParams` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `UnofficialFreeeSdk::QuotationUpdateParams`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'company_id')
        self.company_id = attributes[:'company_id']
      end

      if attributes.key?(:'issue_date')
        self.issue_date = attributes[:'issue_date']
      end

      if attributes.key?(:'partner_id')
        self.partner_id = attributes[:'partner_id']
      end

      if attributes.key?(:'partner_code')
        self.partner_code = attributes[:'partner_code']
      end

      if attributes.key?(:'quotation_number')
        self.quotation_number = attributes[:'quotation_number']
      end

      if attributes.key?(:'title')
        self.title = attributes[:'title']
      end

      if attributes.key?(:'description')
        self.description = attributes[:'description']
      end

      if attributes.key?(:'quotation_status')
        self.quotation_status = attributes[:'quotation_status']
      end

      if attributes.key?(:'partner_display_name')
        self.partner_display_name = attributes[:'partner_display_name']
      end

      if attributes.key?(:'partner_title')
        self.partner_title = attributes[:'partner_title']
      end

      if attributes.key?(:'partner_contact_info')
        self.partner_contact_info = attributes[:'partner_contact_info']
      end

      if attributes.key?(:'partner_zipcode')
        self.partner_zipcode = attributes[:'partner_zipcode']
      end

      if attributes.key?(:'partner_prefecture_code')
        self.partner_prefecture_code = attributes[:'partner_prefecture_code']
      end

      if attributes.key?(:'partner_address1')
        self.partner_address1 = attributes[:'partner_address1']
      end

      if attributes.key?(:'partner_address2')
        self.partner_address2 = attributes[:'partner_address2']
      end

      if attributes.key?(:'company_name')
        self.company_name = attributes[:'company_name']
      end

      if attributes.key?(:'company_zipcode')
        self.company_zipcode = attributes[:'company_zipcode']
      end

      if attributes.key?(:'company_prefecture_code')
        self.company_prefecture_code = attributes[:'company_prefecture_code']
      end

      if attributes.key?(:'company_address1')
        self.company_address1 = attributes[:'company_address1']
      end

      if attributes.key?(:'company_address2')
        self.company_address2 = attributes[:'company_address2']
      end

      if attributes.key?(:'company_contact_info')
        self.company_contact_info = attributes[:'company_contact_info']
      end

      if attributes.key?(:'message')
        self.message = attributes[:'message']
      end

      if attributes.key?(:'notes')
        self.notes = attributes[:'notes']
      end

      if attributes.key?(:'quotation_layout')
        self.quotation_layout = attributes[:'quotation_layout']
      end

      if attributes.key?(:'tax_entry_method')
        self.tax_entry_method = attributes[:'tax_entry_method']
      end

      if attributes.key?(:'quotation_contents')
        if (value = attributes[:'quotation_contents']).is_a?(Array)
          self.quotation_contents = value
        end
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @company_id.nil?
        invalid_properties.push('invalid value for "company_id", company_id cannot be nil.')
      end

      if @company_id > 4294967295
        invalid_properties.push('invalid value for "company_id", must be smaller than or equal to 4294967295.')
      end

      if @company_id < 1
        invalid_properties.push('invalid value for "company_id", must be greater than or equal to 1.')
      end

      if !@partner_id.nil? && @partner_id > 999999999999
        invalid_properties.push('invalid value for "partner_id", must be smaller than or equal to 999999999999.')
      end

      if !@partner_id.nil? && @partner_id < 1
        invalid_properties.push('invalid value for "partner_id", must be greater than or equal to 1.')
      end

      if @partner_display_name.nil?
        invalid_properties.push('invalid value for "partner_display_name", partner_display_name cannot be nil.')
      end

      if @partner_title.nil?
        invalid_properties.push('invalid value for "partner_title", partner_title cannot be nil.')
      end

      if !@partner_prefecture_code.nil? && @partner_prefecture_code > 46
        invalid_properties.push('invalid value for "partner_prefecture_code", must be smaller than or equal to 46.')
      end

      if !@partner_prefecture_code.nil? && @partner_prefecture_code < 0
        invalid_properties.push('invalid value for "partner_prefecture_code", must be greater than or equal to 0.')
      end

      if !@company_prefecture_code.nil? && @company_prefecture_code > 46
        invalid_properties.push('invalid value for "company_prefecture_code", must be smaller than or equal to 46.')
      end

      if !@company_prefecture_code.nil? && @company_prefecture_code < 0
        invalid_properties.push('invalid value for "company_prefecture_code", must be greater than or equal to 0.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @company_id.nil?
      return false if @company_id > 4294967295
      return false if @company_id < 1
      return false if !@partner_id.nil? && @partner_id > 999999999999
      return false if !@partner_id.nil? && @partner_id < 1
      quotation_status_validator = EnumAttributeValidator.new('String', ["unsubmitted", "submitted"])
      return false unless quotation_status_validator.valid?(@quotation_status)
      return false if @partner_display_name.nil?
      return false if @partner_title.nil?
      return false if !@partner_prefecture_code.nil? && @partner_prefecture_code > 46
      return false if !@partner_prefecture_code.nil? && @partner_prefecture_code < 0
      return false if !@company_prefecture_code.nil? && @company_prefecture_code > 46
      return false if !@company_prefecture_code.nil? && @company_prefecture_code < 0
      quotation_layout_validator = EnumAttributeValidator.new('String', ["default_classic", "standard_classic", "envelope_classic", "default_modern", "standard_modern", "envelope_modern"])
      return false unless quotation_layout_validator.valid?(@quotation_layout)
      tax_entry_method_validator = EnumAttributeValidator.new('String', ["inclusive", "exclusive"])
      return false unless tax_entry_method_validator.valid?(@tax_entry_method)
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] company_id Value to be assigned
    def company_id=(company_id)
      if company_id.nil?
        fail ArgumentError, 'company_id cannot be nil'
      end

      if company_id > 4294967295
        fail ArgumentError, 'invalid value for "company_id", must be smaller than or equal to 4294967295.'
      end

      if company_id < 1
        fail ArgumentError, 'invalid value for "company_id", must be greater than or equal to 1.'
      end

      @company_id = company_id
    end

    # Custom attribute writer method with validation
    # @param [Object] partner_id Value to be assigned
    def partner_id=(partner_id)
      if !partner_id.nil? && partner_id > 999999999999
        fail ArgumentError, 'invalid value for "partner_id", must be smaller than or equal to 999999999999.'
      end

      if !partner_id.nil? && partner_id < 1
        fail ArgumentError, 'invalid value for "partner_id", must be greater than or equal to 1.'
      end

      @partner_id = partner_id
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] quotation_status Object to be assigned
    def quotation_status=(quotation_status)
      validator = EnumAttributeValidator.new('String', ["unsubmitted", "submitted"])
      unless validator.valid?(quotation_status)
        fail ArgumentError, "invalid value for \"quotation_status\", must be one of #{validator.allowable_values}."
      end
      @quotation_status = quotation_status
    end

    # Custom attribute writer method with validation
    # @param [Object] partner_prefecture_code Value to be assigned
    def partner_prefecture_code=(partner_prefecture_code)
      if !partner_prefecture_code.nil? && partner_prefecture_code > 46
        fail ArgumentError, 'invalid value for "partner_prefecture_code", must be smaller than or equal to 46.'
      end

      if !partner_prefecture_code.nil? && partner_prefecture_code < 0
        fail ArgumentError, 'invalid value for "partner_prefecture_code", must be greater than or equal to 0.'
      end

      @partner_prefecture_code = partner_prefecture_code
    end

    # Custom attribute writer method with validation
    # @param [Object] company_prefecture_code Value to be assigned
    def company_prefecture_code=(company_prefecture_code)
      if !company_prefecture_code.nil? && company_prefecture_code > 46
        fail ArgumentError, 'invalid value for "company_prefecture_code", must be smaller than or equal to 46.'
      end

      if !company_prefecture_code.nil? && company_prefecture_code < 0
        fail ArgumentError, 'invalid value for "company_prefecture_code", must be greater than or equal to 0.'
      end

      @company_prefecture_code = company_prefecture_code
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] quotation_layout Object to be assigned
    def quotation_layout=(quotation_layout)
      validator = EnumAttributeValidator.new('String', ["default_classic", "standard_classic", "envelope_classic", "default_modern", "standard_modern", "envelope_modern"])
      unless validator.valid?(quotation_layout)
        fail ArgumentError, "invalid value for \"quotation_layout\", must be one of #{validator.allowable_values}."
      end
      @quotation_layout = quotation_layout
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] tax_entry_method Object to be assigned
    def tax_entry_method=(tax_entry_method)
      validator = EnumAttributeValidator.new('String', ["inclusive", "exclusive"])
      unless validator.valid?(tax_entry_method)
        fail ArgumentError, "invalid value for \"tax_entry_method\", must be one of #{validator.allowable_values}."
      end
      @tax_entry_method = tax_entry_method
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          company_id == o.company_id &&
          issue_date == o.issue_date &&
          partner_id == o.partner_id &&
          partner_code == o.partner_code &&
          quotation_number == o.quotation_number &&
          title == o.title &&
          description == o.description &&
          quotation_status == o.quotation_status &&
          partner_display_name == o.partner_display_name &&
          partner_title == o.partner_title &&
          partner_contact_info == o.partner_contact_info &&
          partner_zipcode == o.partner_zipcode &&
          partner_prefecture_code == o.partner_prefecture_code &&
          partner_address1 == o.partner_address1 &&
          partner_address2 == o.partner_address2 &&
          company_name == o.company_name &&
          company_zipcode == o.company_zipcode &&
          company_prefecture_code == o.company_prefecture_code &&
          company_address1 == o.company_address1 &&
          company_address2 == o.company_address2 &&
          company_contact_info == o.company_contact_info &&
          message == o.message &&
          notes == o.notes &&
          quotation_layout == o.quotation_layout &&
          tax_entry_method == o.tax_entry_method &&
          quotation_contents == o.quotation_contents
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [company_id, issue_date, partner_id, partner_code, quotation_number, title, description, quotation_status, partner_display_name, partner_title, partner_contact_info, partner_zipcode, partner_prefecture_code, partner_address1, partner_address2, company_name, company_zipcode, company_prefecture_code, company_address1, company_address2, company_contact_info, message, notes, quotation_layout, tax_entry_method, quotation_contents].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      new.build_from_hash(attributes)
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.openapi_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        UnofficialFreeeSdk.const_get(type).build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = self.class.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end
        
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end
  end
end
