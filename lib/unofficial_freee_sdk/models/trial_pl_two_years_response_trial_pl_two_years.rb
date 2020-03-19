=begin
#freee API

# <h1 id=\"freee_api\">freee API</h1> <hr /> <h2 id=\"\">スタートガイド</h2>  <p>freee API開発がはじめての方は<a href=\"https://developer.freee.co.jp/getting-started\">freee API スタートガイド</a>を参照してください。</p>  <hr /> <h2 id=\"_2\">仕様</h2>  <h3 id=\"api\">APIエンドポイント</h3>  <p>https://api.freee.co.jp/ (httpsのみ)</p>  <h3 id=\"_3\">認証方式</h3>  <p><a href=\"http://tools.ietf.org/html/rfc6749\">OAuth2</a>に対応</p>  <ul> <li>Authorization Code Flow (Webアプリ向け)</li>  <li>Implicit Flow (Mobileアプリ向け)</li> </ul>  <h3 id=\"_4\">認証エンドポイント</h3>  <p>https://accounts.secure.freee.co.jp/</p>  <ul> <li>authorize : https://accounts.secure.freee.co.jp/public_api/authorize</li>  <li>token : https://accounts.secure.freee.co.jp/public_api/token</li> </ul>  <h3 id=\"_5\">アクセストークンのリフレッシュ</h3>  <p>認証時に得たrefresh_token を使ってtoken の期限をリフレッシュして新規に発行することが出来ます。</p>  <p>grant_type=refresh_token で https://accounts.secure.freee.co.jp/public_api/token にアクセスすればリフレッシュされます。</p>  <p>e.g.)</p>  <p>POST: https://accounts.secure.freee.co.jp/public_api/token</p>  <p>params: grant_type=refresh_token&amp;client_id=UID&amp;client_secret=SECRET&amp;refresh_token=REFRESH_TOKEN</p>  <p>詳細は<a href=\"https://github.com/applicake/doorkeeper/wiki/Enable-Refresh-Token-Credentials#flow\">refresh_token</a>を参照下さい。</p>  <h3 id=\"_6\">アクセストークンの破棄</h3>  <p>認証時に得たaccess_tokenまたはrefresh_tokenを使って、tokenを破棄することができます。 token=access_tokenまたはtoken=refresh_tokenでhttps://accounts.secure.freee.co.jp/public_api/revokeにアクセスすると破棄されます。token_type_hintでaccess_tokenまたはrefresh_tokenを陽に指定できます。</p>  <p>e.g.)</p>  <p>POST: https://accounts.secure.freee.co.jp/public_api/revoke</p>  <p>params: token=ACCESS_TOKEN</p>  <p>または</p>  <p>params: token=REFRESH_TOKEN</p>  <p>または</p>  <p>params: token=ACCESS_TOKEN&amp;token_type_hint=access_token</p>  <p>または</p>  <p>params: token=REFRESH_TOKEN&amp;token_type_hint=refresh_token</p>  <p>詳細は <a href=\"https://tools.ietf.org/html/rfc7009\">OAuth 2.0 Token revocation</a> をご参照ください。</p>  <h3 id=\"_7\">データフォーマット</h3>  <p>リクエスト、レスポンスともにJSON形式をサポート</p>  <h3 id=\"_8\">後方互換性ありの変更</h3>  <p>freeeでは、APIを改善していくために以下のような変更は後方互換性ありとして通知なく変更を入れることがあります。アプリケーション実装者は以下を踏まえて開発を行ってください。</p>  <ul> <li>新しいAPIリソース・エンドポイントの追加</li> <li>既存のAPIに対して必須ではない新しいリクエストパラメータの追加</li> <li>既存のAPIレスポンスに対する新しいプロパティの追加</li> <li>既存のAPIレスポンスに対するプロパティの順番の入れ変え</li> <li>keyとなっているidやcodeの長さの変更（長くする）</li> </ul>  <h3 id=\"_9\">共通レスポンスヘッダー</h3>  <p>すべてのAPIのレスポンスには以下のHTTPヘッダーが含まれます。</p>  <ul> <li> <p>X-Freee-Request-ID</p> <ul> <li>各リクエスト毎に発行されるID</li> </ul> </li> </ul>  <h3 id=\"_10\">共通エラーレスポンス</h3>  <ul> <li> <p>ステータスコードはレスポンス内のJSONに含まれる他、HTTPヘッダにも含まれる</p> </li>  <li> <p>type</p>  <ul> <li>status : HTTPステータスコードの説明</li>  <li>validation : エラーの詳細の説明（開発者向け）</li> </ul> </li> </ul>  <p>レスポンスの例</p>  <pre><code>  {     &quot;status_code&quot; : 400,     &quot;errors&quot; : [       {         &quot;type&quot; : &quot;status&quot;,         &quot;messages&quot; : [&quot;不正なリクエストです。&quot;]       },       {         &quot;type&quot; : &quot;validation&quot;,         &quot;messages&quot; : [&quot;Date は不正な日付フォーマットです。入力例：2013-01-01&quot;]       }     ]   }</code></pre>  </br>  <h3 id=\"_11\">API使用制限</h3>    <p>freeeは一定期間に過度のアクセスを検知した場合、APIアクセスをコントロールする場合があります。</p>   <p>その際のhttp status codeは403となります。制限がかかってから10分程度が過ぎると再度使用することができるようになります。</p>  <h4 id=\"_12\">/reportsエンドポイント</h4>  <p>freeeは/reportsエンドポイントに対して1秒間に10以上のアクセスを検知した場合、APIアクセスをコントロールする場合があります。その際のhttp status codeは429（too many requests）となります。</p>  <p>レスポンスボディのmetaプロパティに以下を含めます。</p>  <ul>   <li>設定されている上限値</li>   <li>上限に達するまでの使用可能回数</li>   <li>（上限値に達した場合）使用回数がリセットされる時刻</li> </ul>  <h3 id=\"_13\">プラン別のAPI Rate Limit</h3>   <table border=\"1\">     <tbody>       <tr>         <th style=\"padding: 10px\"><strong>会計freeeプラン名</strong></th>         <th style=\"padding: 10px\"><strong>事業所とアプリケーション毎に1日でのAPIコール数</strong></th>       </tr>       <tr>         <td style=\"padding: 10px\">エンタープライズ</td>         <td style=\"padding: 10px\">10,000</td>       </tr>       <tr>         <td style=\"padding: 10px\">プロフェッショナル</td>         <td style=\"padding: 10px\">5,000</td>       </tr>       <tr>         <td style=\"padding: 10px\">ベーシック</td>         <td style=\"padding: 10px\">3,000</td>       </tr>       <tr>         <td style=\"padding: 10px\">ミニマム</td>         <td style=\"padding: 10px\">3,000</td>       </tr>       <tr>         <td style=\"padding: 10px\">上記以外</td>         <td style=\"padding: 10px\">3,000</td>       </tr>     </tbody>   </table>  <hr /> <h2 id=\"_14\">連絡先</h2>  <p>ご不明点、ご要望等は <a href=\"https://support.freee.co.jp/hc/ja/requests/new\">freee サポートデスクへのお問い合わせフォーム</a> からご連絡ください。</p> <hr />&copy; Since 2013 freee K.K.

The version of the OpenAPI document: v1.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.2.3

=end

require 'date'

module UnofficialFreeeSdk
  class TrialPlTwoYearsResponseTrialPlTwoYears
    # 事業所ID
    attr_accessor :company_id

    # 集計結果が最新かどうか
    attr_accessor :up_to_date

    # 会計年度(条件に指定した時、または条件に月、日条件がない時のみ含まれる）
    attr_accessor :fiscal_year

    # 発生月で絞込：開始会計月(mm)(条件に指定した時のみ含まれる）
    attr_accessor :start_month

    # 発生月で絞込：終了会計月(mm)(条件に指定した時のみ含まれる）
    attr_accessor :end_month

    # 発生日で絞込：開始日(yyyy-mm-dd)(条件に指定した時のみ含まれる）
    attr_accessor :start_date

    # 発生日で絞込：終了日(yyyy-mm-dd)(条件に指定した時のみ含まれる）
    attr_accessor :end_date

    # 勘定科目の表示（勘定科目: account_item, 決算書表示:group）(条件に指定した時のみ含まれる）
    attr_accessor :account_item_display_type

    # 内訳の表示（取引先: partner, 品目: item, 部門: section, 勘定科目: account_item）(条件に指定した時のみ含まれる）
    attr_accessor :breakdown_display_type

    # 取引先ID(条件に指定した時のみ含まれる）
    attr_accessor :partner_id

    # 取引先コード(条件に指定した時のみ含まれる）
    attr_accessor :partner_code

    # 品目ID(条件に指定した時のみ含まれる）
    attr_accessor :item_id

    # 部門ID(条件に指定した時のみ含まれる）
    attr_accessor :section_id

    # 決算整理仕訳のみ: only, 決算整理仕訳以外: without(条件に指定した時のみ含まれる）
    attr_accessor :adjustment

    # 配賦仕訳のみ：only,配賦仕訳以外：without(条件に指定した時のみ含まれる）
    attr_accessor :cost_allocation

    # 作成日時
    attr_accessor :created_at

    attr_accessor :balances

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
        :'up_to_date' => :'up_to_date',
        :'fiscal_year' => :'fiscal_year',
        :'start_month' => :'start_month',
        :'end_month' => :'end_month',
        :'start_date' => :'start_date',
        :'end_date' => :'end_date',
        :'account_item_display_type' => :'account_item_display_type',
        :'breakdown_display_type' => :'breakdown_display_type',
        :'partner_id' => :'partner_id',
        :'partner_code' => :'partner_code',
        :'item_id' => :'item_id',
        :'section_id' => :'section_id',
        :'adjustment' => :'adjustment',
        :'cost_allocation' => :'cost_allocation',
        :'created_at' => :'created_at',
        :'balances' => :'balances'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'company_id' => :'Integer',
        :'up_to_date' => :'Boolean',
        :'fiscal_year' => :'Integer',
        :'start_month' => :'Integer',
        :'end_month' => :'Integer',
        :'start_date' => :'String',
        :'end_date' => :'String',
        :'account_item_display_type' => :'String',
        :'breakdown_display_type' => :'String',
        :'partner_id' => :'Integer',
        :'partner_code' => :'String',
        :'item_id' => :'Integer',
        :'section_id' => :'Integer',
        :'adjustment' => :'String',
        :'cost_allocation' => :'String',
        :'created_at' => :'String',
        :'balances' => :'Array<TrialPlTwoYearsResponseTrialPlTwoYearsBalances>'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `UnofficialFreeeSdk::TrialPlTwoYearsResponseTrialPlTwoYears` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `UnofficialFreeeSdk::TrialPlTwoYearsResponseTrialPlTwoYears`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'company_id')
        self.company_id = attributes[:'company_id']
      end

      if attributes.key?(:'up_to_date')
        self.up_to_date = attributes[:'up_to_date']
      end

      if attributes.key?(:'fiscal_year')
        self.fiscal_year = attributes[:'fiscal_year']
      end

      if attributes.key?(:'start_month')
        self.start_month = attributes[:'start_month']
      end

      if attributes.key?(:'end_month')
        self.end_month = attributes[:'end_month']
      end

      if attributes.key?(:'start_date')
        self.start_date = attributes[:'start_date']
      end

      if attributes.key?(:'end_date')
        self.end_date = attributes[:'end_date']
      end

      if attributes.key?(:'account_item_display_type')
        self.account_item_display_type = attributes[:'account_item_display_type']
      end

      if attributes.key?(:'breakdown_display_type')
        self.breakdown_display_type = attributes[:'breakdown_display_type']
      end

      if attributes.key?(:'partner_id')
        self.partner_id = attributes[:'partner_id']
      end

      if attributes.key?(:'partner_code')
        self.partner_code = attributes[:'partner_code']
      end

      if attributes.key?(:'item_id')
        self.item_id = attributes[:'item_id']
      end

      if attributes.key?(:'section_id')
        self.section_id = attributes[:'section_id']
      end

      if attributes.key?(:'adjustment')
        self.adjustment = attributes[:'adjustment']
      end

      if attributes.key?(:'cost_allocation')
        self.cost_allocation = attributes[:'cost_allocation']
      end

      if attributes.key?(:'created_at')
        self.created_at = attributes[:'created_at']
      end

      if attributes.key?(:'balances')
        if (value = attributes[:'balances']).is_a?(Array)
          self.balances = value
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

      if @up_to_date.nil?
        invalid_properties.push('invalid value for "up_to_date", up_to_date cannot be nil.')
      end

      if !@start_month.nil? && @start_month > 12
        invalid_properties.push('invalid value for "start_month", must be smaller than or equal to 12.')
      end

      if !@start_month.nil? && @start_month < 1
        invalid_properties.push('invalid value for "start_month", must be greater than or equal to 1.')
      end

      if !@end_month.nil? && @end_month > 12
        invalid_properties.push('invalid value for "end_month", must be smaller than or equal to 12.')
      end

      if !@end_month.nil? && @end_month < 1
        invalid_properties.push('invalid value for "end_month", must be greater than or equal to 1.')
      end

      if !@partner_id.nil? && @partner_id > 999999999999
        invalid_properties.push('invalid value for "partner_id", must be smaller than or equal to 999999999999.')
      end

      if !@partner_id.nil? && @partner_id < 1
        invalid_properties.push('invalid value for "partner_id", must be greater than or equal to 1.')
      end

      if !@item_id.nil? && @item_id > 999999999999
        invalid_properties.push('invalid value for "item_id", must be smaller than or equal to 999999999999.')
      end

      if !@item_id.nil? && @item_id < 1
        invalid_properties.push('invalid value for "item_id", must be greater than or equal to 1.')
      end

      if !@section_id.nil? && @section_id > 999999999999
        invalid_properties.push('invalid value for "section_id", must be smaller than or equal to 999999999999.')
      end

      if !@section_id.nil? && @section_id < 1
        invalid_properties.push('invalid value for "section_id", must be greater than or equal to 1.')
      end

      if @balances.nil?
        invalid_properties.push('invalid value for "balances", balances cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @company_id.nil?
      return false if @company_id > 4294967295
      return false if @company_id < 1
      return false if @up_to_date.nil?
      return false if !@start_month.nil? && @start_month > 12
      return false if !@start_month.nil? && @start_month < 1
      return false if !@end_month.nil? && @end_month > 12
      return false if !@end_month.nil? && @end_month < 1
      account_item_display_type_validator = EnumAttributeValidator.new('String', ["account_item", "group"])
      return false unless account_item_display_type_validator.valid?(@account_item_display_type)
      breakdown_display_type_validator = EnumAttributeValidator.new('String', ["partner", "item", "section", "account_item"])
      return false unless breakdown_display_type_validator.valid?(@breakdown_display_type)
      return false if !@partner_id.nil? && @partner_id > 999999999999
      return false if !@partner_id.nil? && @partner_id < 1
      return false if !@item_id.nil? && @item_id > 999999999999
      return false if !@item_id.nil? && @item_id < 1
      return false if !@section_id.nil? && @section_id > 999999999999
      return false if !@section_id.nil? && @section_id < 1
      adjustment_validator = EnumAttributeValidator.new('String', ["only", "without"])
      return false unless adjustment_validator.valid?(@adjustment)
      cost_allocation_validator = EnumAttributeValidator.new('String', ["only", "without"])
      return false unless cost_allocation_validator.valid?(@cost_allocation)
      return false if @balances.nil?
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
    # @param [Object] start_month Value to be assigned
    def start_month=(start_month)
      if !start_month.nil? && start_month > 12
        fail ArgumentError, 'invalid value for "start_month", must be smaller than or equal to 12.'
      end

      if !start_month.nil? && start_month < 1
        fail ArgumentError, 'invalid value for "start_month", must be greater than or equal to 1.'
      end

      @start_month = start_month
    end

    # Custom attribute writer method with validation
    # @param [Object] end_month Value to be assigned
    def end_month=(end_month)
      if !end_month.nil? && end_month > 12
        fail ArgumentError, 'invalid value for "end_month", must be smaller than or equal to 12.'
      end

      if !end_month.nil? && end_month < 1
        fail ArgumentError, 'invalid value for "end_month", must be greater than or equal to 1.'
      end

      @end_month = end_month
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] account_item_display_type Object to be assigned
    def account_item_display_type=(account_item_display_type)
      validator = EnumAttributeValidator.new('String', ["account_item", "group"])
      unless validator.valid?(account_item_display_type)
        fail ArgumentError, "invalid value for \"account_item_display_type\", must be one of #{validator.allowable_values}."
      end
      @account_item_display_type = account_item_display_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] breakdown_display_type Object to be assigned
    def breakdown_display_type=(breakdown_display_type)
      validator = EnumAttributeValidator.new('String', ["partner", "item", "section", "account_item"])
      unless validator.valid?(breakdown_display_type)
        fail ArgumentError, "invalid value for \"breakdown_display_type\", must be one of #{validator.allowable_values}."
      end
      @breakdown_display_type = breakdown_display_type
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

    # Custom attribute writer method with validation
    # @param [Object] item_id Value to be assigned
    def item_id=(item_id)
      if !item_id.nil? && item_id > 999999999999
        fail ArgumentError, 'invalid value for "item_id", must be smaller than or equal to 999999999999.'
      end

      if !item_id.nil? && item_id < 1
        fail ArgumentError, 'invalid value for "item_id", must be greater than or equal to 1.'
      end

      @item_id = item_id
    end

    # Custom attribute writer method with validation
    # @param [Object] section_id Value to be assigned
    def section_id=(section_id)
      if !section_id.nil? && section_id > 999999999999
        fail ArgumentError, 'invalid value for "section_id", must be smaller than or equal to 999999999999.'
      end

      if !section_id.nil? && section_id < 1
        fail ArgumentError, 'invalid value for "section_id", must be greater than or equal to 1.'
      end

      @section_id = section_id
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] adjustment Object to be assigned
    def adjustment=(adjustment)
      validator = EnumAttributeValidator.new('String', ["only", "without"])
      unless validator.valid?(adjustment)
        fail ArgumentError, "invalid value for \"adjustment\", must be one of #{validator.allowable_values}."
      end
      @adjustment = adjustment
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] cost_allocation Object to be assigned
    def cost_allocation=(cost_allocation)
      validator = EnumAttributeValidator.new('String', ["only", "without"])
      unless validator.valid?(cost_allocation)
        fail ArgumentError, "invalid value for \"cost_allocation\", must be one of #{validator.allowable_values}."
      end
      @cost_allocation = cost_allocation
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          company_id == o.company_id &&
          up_to_date == o.up_to_date &&
          fiscal_year == o.fiscal_year &&
          start_month == o.start_month &&
          end_month == o.end_month &&
          start_date == o.start_date &&
          end_date == o.end_date &&
          account_item_display_type == o.account_item_display_type &&
          breakdown_display_type == o.breakdown_display_type &&
          partner_id == o.partner_id &&
          partner_code == o.partner_code &&
          item_id == o.item_id &&
          section_id == o.section_id &&
          adjustment == o.adjustment &&
          cost_allocation == o.cost_allocation &&
          created_at == o.created_at &&
          balances == o.balances
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [company_id, up_to_date, fiscal_year, start_month, end_month, start_date, end_date, account_item_display_type, breakdown_display_type, partner_id, partner_code, item_id, section_id, adjustment, cost_allocation, created_at, balances].hash
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