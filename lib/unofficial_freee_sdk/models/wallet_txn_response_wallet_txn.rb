=begin
#freee API

# <h1 id=\"freee_api\">freee API</h1> <hr /> <h2 id=\"\">スタートガイド</h2>  <p>freee API開発がはじめての方は<a href=\"https://developer.freee.co.jp/getting-started\">freee API スタートガイド</a>を参照してください。</p>  <hr /> <h2 id=\"_2\">仕様</h2>  <h3 id=\"api\">APIエンドポイント</h3>  <p>https://api.freee.co.jp/ (httpsのみ)</p>  <h3 id=\"_3\">認証方式</h3>  <p><a href=\"http://tools.ietf.org/html/rfc6749\">OAuth2</a>に対応</p>  <ul> <li>Authorization Code Flow (Webアプリ向け)</li>  <li>Implicit Flow (Mobileアプリ向け)</li> </ul>  <h3 id=\"_4\">認証エンドポイント</h3>  <p>https://accounts.secure.freee.co.jp/</p>  <ul> <li>authorize : https://accounts.secure.freee.co.jp/public_api/authorize</li>  <li>token : https://accounts.secure.freee.co.jp/public_api/token</li> </ul>  <h3 id=\"_5\">アクセストークンのリフレッシュ</h3>  <p>認証時に得たrefresh_token を使ってtoken の期限をリフレッシュして新規に発行することが出来ます。</p>  <p>grant_type=refresh_token で https://accounts.secure.freee.co.jp/public_api/token にアクセスすればリフレッシュされます。</p>  <p>e.g.)</p>  <p>POST: https://accounts.secure.freee.co.jp/public_api/token</p>  <p>params: grant_type=refresh_token&amp;client_id=UID&amp;client_secret=SECRET&amp;refresh_token=REFRESH_TOKEN</p>  <p>詳細は<a href=\"https://github.com/applicake/doorkeeper/wiki/Enable-Refresh-Token-Credentials#flow\">refresh_token</a>を参照下さい。</p>  <h3 id=\"_6\">アクセストークンの破棄</h3>  <p>認証時に得たaccess_tokenまたはrefresh_tokenを使って、tokenを破棄することができます。 token=access_tokenまたはtoken=refresh_tokenでhttps://accounts.secure.freee.co.jp/public_api/revokeにアクセスすると破棄されます。token_type_hintでaccess_tokenまたはrefresh_tokenを陽に指定できます。</p>  <p>e.g.)</p>  <p>POST: https://accounts.secure.freee.co.jp/public_api/revoke</p>  <p>params: token=ACCESS_TOKEN</p>  <p>または</p>  <p>params: token=REFRESH_TOKEN</p>  <p>または</p>  <p>params: token=ACCESS_TOKEN&amp;token_type_hint=access_token</p>  <p>または</p>  <p>params: token=REFRESH_TOKEN&amp;token_type_hint=refresh_token</p>  <p>詳細は <a href=\"https://tools.ietf.org/html/rfc7009\">OAuth 2.0 Token revocation</a> をご参照ください。</p>  <h3 id=\"_7\">データフォーマット</h3>  <p>リクエスト、レスポンスともにJSON形式をサポート</p>  <h3 id=\"_8\">後方互換性ありの変更</h3>  <p>freeeでは、APIを改善していくために以下のような変更は後方互換性ありとして通知なく変更を入れることがあります。アプリケーション実装者は以下を踏まえて開発を行ってください。</p>  <ul> <li>新しいAPIリソース・エンドポイントの追加</li> <li>既存のAPIに対して必須ではない新しいリクエストパラメータの追加</li> <li>既存のAPIレスポンスに対する新しいプロパティの追加</li> <li>既存のAPIレスポンスに対するプロパティの順番の入れ変え</li> <li>keyとなっているidやcodeの長さの変更（長くする）</li> </ul>  <h3 id=\"_9\">共通レスポンスヘッダー</h3>  <p>すべてのAPIのレスポンスには以下のHTTPヘッダーが含まれます。</p>  <ul> <li> <p>X-Freee-Request-ID</p> <ul> <li>各リクエスト毎に発行されるID</li> </ul> </li> </ul>  <h3 id=\"_10\">共通エラーレスポンス</h3>  <ul> <li> <p>ステータスコードはレスポンス内のJSONに含まれる他、HTTPヘッダにも含まれる</p> </li>  <li> <p>type</p>  <ul> <li>status : HTTPステータスコードの説明</li>  <li>validation : エラーの詳細の説明（開発者向け）</li> </ul> </li> </ul>  <p>レスポンスの例</p>  <pre><code>  {     &quot;status_code&quot; : 400,     &quot;errors&quot; : [       {         &quot;type&quot; : &quot;status&quot;,         &quot;messages&quot; : [&quot;不正なリクエストです。&quot;]       },       {         &quot;type&quot; : &quot;validation&quot;,         &quot;messages&quot; : [&quot;Date は不正な日付フォーマットです。入力例：2013-01-01&quot;]       }     ]   }</code></pre>  </br>  <h3 id=\"_11\">API使用制限</h3>    <p>freeeは一定期間に過度のアクセスを検知した場合、APIアクセスをコントロールする場合があります。</p>   <p>その際のhttp status codeは403となります。制限がかかってから10分程度が過ぎると再度使用することができるようになります。</p>  <h4 id=\"_12\">/reportsエンドポイント</h4>  <p>freeeは/reportsエンドポイントに対して1秒間に10以上のアクセスを検知した場合、APIアクセスをコントロールする場合があります。その際のhttp status codeは429（too many requests）となります。</p>  <p>レスポンスボディのmetaプロパティに以下を含めます。</p>  <ul>   <li>設定されている上限値</li>   <li>上限に達するまでの使用可能回数</li>   <li>（上限値に達した場合）使用回数がリセットされる時刻</li> </ul>  <h3 id=\"_13\">プラン別のAPI Rate Limit</h3>   <table border=\"1\">     <tbody>       <tr>         <th style=\"padding: 10px\"><strong>会計freeeプラン名</strong></th>         <th style=\"padding: 10px\"><strong>事業所とアプリケーション毎に1日でのAPIコール数</strong></th>       </tr>       <tr>         <td style=\"padding: 10px\">エンタープライズ</td>         <td style=\"padding: 10px\">10,000</td>       </tr>       <tr>         <td style=\"padding: 10px\">プロフェッショナル</td>         <td style=\"padding: 10px\">5,000</td>       </tr>       <tr>         <td style=\"padding: 10px\">ベーシック</td>         <td style=\"padding: 10px\">3,000</td>       </tr>       <tr>         <td style=\"padding: 10px\">ミニマム</td>         <td style=\"padding: 10px\">3,000</td>       </tr>       <tr>         <td style=\"padding: 10px\">上記以外</td>         <td style=\"padding: 10px\">3,000</td>       </tr>     </tbody>   </table>  <hr /> <h2 id=\"_14\">連絡先</h2>  <p>ご不明点、ご要望等は <a href=\"https://support.freee.co.jp/hc/ja/requests/new\">freee サポートデスクへのお問い合わせフォーム</a> からご連絡ください。</p> <hr />&copy; Since 2013 freee K.K.

The version of the OpenAPI document: v1.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.2.3

=end

require 'date'

module UnofficialFreeeSdk
  class WalletTxnResponseWalletTxn
    # 明細ID
    attr_accessor :id

    # 事業所ID
    attr_accessor :company_id

    # 取引日(yyyy-mm-dd)
    attr_accessor :date

    # 取引金額
    attr_accessor :amount

    # 未決済金額
    attr_accessor :due_amount

    # 残高(銀行口座等)
    attr_accessor :balance

    # 入金／出金 (入金: income, 出金: expense)
    attr_accessor :entry_side

    # 口座区分 (銀行口座: bank_account, クレジットカード: credit_card, 現金: wallet)
    attr_accessor :walletable_type

    # 口座ID
    attr_accessor :walletable_id

    # 備考
    attr_accessor :description

    # 明細のステータス（消込待ち: 1, 消込済み: 2, 無視: 3, 消込中: 4）
    attr_accessor :status

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
        :'id' => :'id',
        :'company_id' => :'company_id',
        :'date' => :'date',
        :'amount' => :'amount',
        :'due_amount' => :'due_amount',
        :'balance' => :'balance',
        :'entry_side' => :'entry_side',
        :'walletable_type' => :'walletable_type',
        :'walletable_id' => :'walletable_id',
        :'description' => :'description',
        :'status' => :'status'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'id' => :'Integer',
        :'company_id' => :'Integer',
        :'date' => :'String',
        :'amount' => :'Integer',
        :'due_amount' => :'Integer',
        :'balance' => :'Integer',
        :'entry_side' => :'String',
        :'walletable_type' => :'String',
        :'walletable_id' => :'Integer',
        :'description' => :'String',
        :'status' => :'Integer'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `UnofficialFreeeSdk::WalletTxnResponseWalletTxn` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `UnofficialFreeeSdk::WalletTxnResponseWalletTxn`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.key?(:'company_id')
        self.company_id = attributes[:'company_id']
      end

      if attributes.key?(:'date')
        self.date = attributes[:'date']
      end

      if attributes.key?(:'amount')
        self.amount = attributes[:'amount']
      end

      if attributes.key?(:'due_amount')
        self.due_amount = attributes[:'due_amount']
      end

      if attributes.key?(:'balance')
        self.balance = attributes[:'balance']
      end

      if attributes.key?(:'entry_side')
        self.entry_side = attributes[:'entry_side']
      end

      if attributes.key?(:'walletable_type')
        self.walletable_type = attributes[:'walletable_type']
      end

      if attributes.key?(:'walletable_id')
        self.walletable_id = attributes[:'walletable_id']
      end

      if attributes.key?(:'description')
        self.description = attributes[:'description']
      end

      if attributes.key?(:'status')
        self.status = attributes[:'status']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @id.nil?
        invalid_properties.push('invalid value for "id", id cannot be nil.')
      end

      if @id > 999999999999
        invalid_properties.push('invalid value for "id", must be smaller than or equal to 999999999999.')
      end

      if @id < 1
        invalid_properties.push('invalid value for "id", must be greater than or equal to 1.')
      end

      if @company_id.nil?
        invalid_properties.push('invalid value for "company_id", company_id cannot be nil.')
      end

      if @company_id > 4294967295
        invalid_properties.push('invalid value for "company_id", must be smaller than or equal to 4294967295.')
      end

      if @company_id < 1
        invalid_properties.push('invalid value for "company_id", must be greater than or equal to 1.')
      end

      if @date.nil?
        invalid_properties.push('invalid value for "date", date cannot be nil.')
      end

      if @amount.nil?
        invalid_properties.push('invalid value for "amount", amount cannot be nil.')
      end

      if @amount > 999999999999
        invalid_properties.push('invalid value for "amount", must be smaller than or equal to 999999999999.')
      end

      if @amount < -999999999999
        invalid_properties.push('invalid value for "amount", must be greater than or equal to -999999999999.')
      end

      if @due_amount.nil?
        invalid_properties.push('invalid value for "due_amount", due_amount cannot be nil.')
      end

      if @balance.nil?
        invalid_properties.push('invalid value for "balance", balance cannot be nil.')
      end

      if @entry_side.nil?
        invalid_properties.push('invalid value for "entry_side", entry_side cannot be nil.')
      end

      if @walletable_type.nil?
        invalid_properties.push('invalid value for "walletable_type", walletable_type cannot be nil.')
      end

      if @walletable_id.nil?
        invalid_properties.push('invalid value for "walletable_id", walletable_id cannot be nil.')
      end

      if @walletable_id > 999999999999
        invalid_properties.push('invalid value for "walletable_id", must be smaller than or equal to 999999999999.')
      end

      if @walletable_id < 1
        invalid_properties.push('invalid value for "walletable_id", must be greater than or equal to 1.')
      end

      if @description.nil?
        invalid_properties.push('invalid value for "description", description cannot be nil.')
      end

      if @status.nil?
        invalid_properties.push('invalid value for "status", status cannot be nil.')
      end

      if @status > 4
        invalid_properties.push('invalid value for "status", must be smaller than or equal to 4.')
      end

      if @status < 1
        invalid_properties.push('invalid value for "status", must be greater than or equal to 1.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @id.nil?
      return false if @id > 999999999999
      return false if @id < 1
      return false if @company_id.nil?
      return false if @company_id > 4294967295
      return false if @company_id < 1
      return false if @date.nil?
      return false if @amount.nil?
      return false if @amount > 999999999999
      return false if @amount < -999999999999
      return false if @due_amount.nil?
      return false if @balance.nil?
      return false if @entry_side.nil?
      entry_side_validator = EnumAttributeValidator.new('String', ["income", "expense"])
      return false unless entry_side_validator.valid?(@entry_side)
      return false if @walletable_type.nil?
      walletable_type_validator = EnumAttributeValidator.new('String', ["bank_account", "credit_card", "wallet"])
      return false unless walletable_type_validator.valid?(@walletable_type)
      return false if @walletable_id.nil?
      return false if @walletable_id > 999999999999
      return false if @walletable_id < 1
      return false if @description.nil?
      return false if @status.nil?
      return false if @status > 4
      return false if @status < 1
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] id Value to be assigned
    def id=(id)
      if id.nil?
        fail ArgumentError, 'id cannot be nil'
      end

      if id > 999999999999
        fail ArgumentError, 'invalid value for "id", must be smaller than or equal to 999999999999.'
      end

      if id < 1
        fail ArgumentError, 'invalid value for "id", must be greater than or equal to 1.'
      end

      @id = id
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
    # @param [Object] amount Value to be assigned
    def amount=(amount)
      if amount.nil?
        fail ArgumentError, 'amount cannot be nil'
      end

      if amount > 999999999999
        fail ArgumentError, 'invalid value for "amount", must be smaller than or equal to 999999999999.'
      end

      if amount < -999999999999
        fail ArgumentError, 'invalid value for "amount", must be greater than or equal to -999999999999.'
      end

      @amount = amount
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] entry_side Object to be assigned
    def entry_side=(entry_side)
      validator = EnumAttributeValidator.new('String', ["income", "expense"])
      unless validator.valid?(entry_side)
        fail ArgumentError, "invalid value for \"entry_side\", must be one of #{validator.allowable_values}."
      end
      @entry_side = entry_side
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] walletable_type Object to be assigned
    def walletable_type=(walletable_type)
      validator = EnumAttributeValidator.new('String', ["bank_account", "credit_card", "wallet"])
      unless validator.valid?(walletable_type)
        fail ArgumentError, "invalid value for \"walletable_type\", must be one of #{validator.allowable_values}."
      end
      @walletable_type = walletable_type
    end

    # Custom attribute writer method with validation
    # @param [Object] walletable_id Value to be assigned
    def walletable_id=(walletable_id)
      if walletable_id.nil?
        fail ArgumentError, 'walletable_id cannot be nil'
      end

      if walletable_id > 999999999999
        fail ArgumentError, 'invalid value for "walletable_id", must be smaller than or equal to 999999999999.'
      end

      if walletable_id < 1
        fail ArgumentError, 'invalid value for "walletable_id", must be greater than or equal to 1.'
      end

      @walletable_id = walletable_id
    end

    # Custom attribute writer method with validation
    # @param [Object] status Value to be assigned
    def status=(status)
      if status.nil?
        fail ArgumentError, 'status cannot be nil'
      end

      if status > 4
        fail ArgumentError, 'invalid value for "status", must be smaller than or equal to 4.'
      end

      if status < 1
        fail ArgumentError, 'invalid value for "status", must be greater than or equal to 1.'
      end

      @status = status
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          company_id == o.company_id &&
          date == o.date &&
          amount == o.amount &&
          due_amount == o.due_amount &&
          balance == o.balance &&
          entry_side == o.entry_side &&
          walletable_type == o.walletable_type &&
          walletable_id == o.walletable_id &&
          description == o.description &&
          status == o.status
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [id, company_id, date, amount, due_amount, balance, entry_side, walletable_type, walletable_id, description, status].hash
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
