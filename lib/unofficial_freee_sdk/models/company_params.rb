=begin
#freee API

# <h1 id=\"freee_api\">freee API</h1> <hr /> <h2 id=\"\">スタートガイド</h2>  <p>freee API開発がはじめての方は<a href=\"https://developer.freee.co.jp/getting-started\">freee API スタートガイド</a>を参照してください。</p>  <hr /> <h2 id=\"_2\">仕様</h2>  <h3 id=\"api\">APIエンドポイント</h3>  <p>https://api.freee.co.jp/ (httpsのみ)</p>  <h3 id=\"_3\">認証方式</h3>  <p><a href=\"http://tools.ietf.org/html/rfc6749\">OAuth2</a>に対応</p>  <ul> <li>Authorization Code Flow (Webアプリ向け)</li>  <li>Implicit Flow (Mobileアプリ向け)</li> </ul>  <h3 id=\"_4\">認証エンドポイント</h3>  <p>https://accounts.secure.freee.co.jp/</p>  <ul> <li>authorize : https://accounts.secure.freee.co.jp/public_api/authorize</li>  <li>token : https://accounts.secure.freee.co.jp/public_api/token</li> </ul>  <h3 id=\"_5\">アクセストークンのリフレッシュ</h3>  <p>認証時に得たrefresh_token を使ってtoken の期限をリフレッシュして新規に発行することが出来ます。</p>  <p>grant_type=refresh_token で https://accounts.secure.freee.co.jp/public_api/token にアクセスすればリフレッシュされます。</p>  <p>e.g.)</p>  <p>POST: https://accounts.secure.freee.co.jp/public_api/token</p>  <p>params: grant_type=refresh_token&amp;client_id=UID&amp;client_secret=SECRET&amp;refresh_token=REFRESH_TOKEN</p>  <p>詳細は<a href=\"https://github.com/applicake/doorkeeper/wiki/Enable-Refresh-Token-Credentials#flow\">refresh_token</a>を参照下さい。</p>  <h3 id=\"_6\">アクセストークンの破棄</h3>  <p>認証時に得たaccess_tokenまたはrefresh_tokenを使って、tokenを破棄することができます。 token=access_tokenまたはtoken=refresh_tokenでhttps://accounts.secure.freee.co.jp/public_api/revokeにアクセスすると破棄されます。token_type_hintでaccess_tokenまたはrefresh_tokenを陽に指定できます。</p>  <p>e.g.)</p>  <p>POST: https://accounts.secure.freee.co.jp/public_api/revoke</p>  <p>params: token=ACCESS_TOKEN</p>  <p>または</p>  <p>params: token=REFRESH_TOKEN</p>  <p>または</p>  <p>params: token=ACCESS_TOKEN&amp;token_type_hint=access_token</p>  <p>または</p>  <p>params: token=REFRESH_TOKEN&amp;token_type_hint=refresh_token</p>  <p>詳細は <a href=\"https://tools.ietf.org/html/rfc7009\">OAuth 2.0 Token revocation</a> をご参照ください。</p>  <h3 id=\"_7\">データフォーマット</h3>  <p>リクエスト、レスポンスともにJSON形式をサポート</p>  <h3 id=\"_8\">後方互換性ありの変更</h3>  <p>freeeでは、APIを改善していくために以下のような変更は後方互換性ありとして通知なく変更を入れることがあります。アプリケーション実装者は以下を踏まえて開発を行ってください。</p>  <ul> <li>新しいAPIリソース・エンドポイントの追加</li> <li>既存のAPIに対して必須ではない新しいリクエストパラメータの追加</li> <li>既存のAPIレスポンスに対する新しいプロパティの追加</li> <li>既存のAPIレスポンスに対するプロパティの順番の入れ変え</li> <li>keyとなっているidやcodeの長さの変更（長くする）</li> </ul>  <h3 id=\"_9\">共通レスポンスヘッダー</h3>  <p>すべてのAPIのレスポンスには以下のHTTPヘッダーが含まれます。</p>  <ul> <li> <p>X-Freee-Request-ID</p> <ul> <li>各リクエスト毎に発行されるID</li> </ul> </li> </ul>  <h3 id=\"_10\">共通エラーレスポンス</h3>  <ul> <li> <p>ステータスコードはレスポンス内のJSONに含まれる他、HTTPヘッダにも含まれる</p> </li>  <li> <p>type</p>  <ul> <li>status : HTTPステータスコードの説明</li>  <li>validation : エラーの詳細の説明（開発者向け）</li> </ul> </li> </ul>  <p>レスポンスの例</p>  <pre><code>  {     &quot;status_code&quot; : 400,     &quot;errors&quot; : [       {         &quot;type&quot; : &quot;status&quot;,         &quot;messages&quot; : [&quot;不正なリクエストです。&quot;]       },       {         &quot;type&quot; : &quot;validation&quot;,         &quot;messages&quot; : [&quot;Date は不正な日付フォーマットです。入力例：2013-01-01&quot;]       }     ]   }</code></pre>  </br>  <h3 id=\"_11\">API使用制限</h3>    <p>freeeは一定期間に過度のアクセスを検知した場合、APIアクセスをコントロールする場合があります。</p>   <p>その際のhttp status codeは403となります。制限がかかってから10分程度が過ぎると再度使用することができるようになります。</p>  <h4 id=\"_12\">/reportsエンドポイント</h4>  <p>freeeは/reportsエンドポイントに対して1秒間に10以上のアクセスを検知した場合、APIアクセスをコントロールする場合があります。その際のhttp status codeは429（too many requests）となります。</p>  <p>レスポンスボディのmetaプロパティに以下を含めます。</p>  <ul>   <li>設定されている上限値</li>   <li>上限に達するまでの使用可能回数</li>   <li>（上限値に達した場合）使用回数がリセットされる時刻</li> </ul>  <h3 id=\"_13\">プラン別のAPI Rate Limit</h3>   <table border=\"1\">     <tbody>       <tr>         <th style=\"padding: 10px\"><strong>会計freeeプラン名</strong></th>         <th style=\"padding: 10px\"><strong>事業所とアプリケーション毎に1日でのAPIコール数</strong></th>       </tr>       <tr>         <td style=\"padding: 10px\">エンタープライズ</td>         <td style=\"padding: 10px\">10,000</td>       </tr>       <tr>         <td style=\"padding: 10px\">プロフェッショナル</td>         <td style=\"padding: 10px\">5,000</td>       </tr>       <tr>         <td style=\"padding: 10px\">ベーシック</td>         <td style=\"padding: 10px\">3,000</td>       </tr>       <tr>         <td style=\"padding: 10px\">ミニマム</td>         <td style=\"padding: 10px\">3,000</td>       </tr>       <tr>         <td style=\"padding: 10px\">上記以外</td>         <td style=\"padding: 10px\">3,000</td>       </tr>     </tbody>   </table>  <hr /> <h2 id=\"_14\">連絡先</h2>  <p>ご不明点、ご要望等は <a href=\"https://support.freee.co.jp/hc/ja/requests/new\">freee サポートデスクへのお問い合わせフォーム</a> からご連絡ください。</p> <hr />&copy; Since 2013 freee K.K.

The version of the OpenAPI document: v1.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.2.3

=end

require 'date'

module UnofficialFreeeSdk
  class CompanyParams
    # 事業所の正式名称 (100文字以内)
    attr_accessor :name

    # 正式名称フリガナ (100文字以内)
    attr_accessor :name_kana

    # 担当者名 (50文字以内)
    attr_accessor :contact_name

    attr_accessor :address_attributes

    # 電話番号１
    attr_accessor :phone1

    # 電話番号２
    attr_accessor :phone2

    # FAX
    attr_accessor :fax

    attr_accessor :sales_information_attributes

    # 従業員数（0: 経営者のみ、1: 2~5人、2: 6~10人、3: 11~20人、13: 21~50人、14: 51~100人、15: 101~300人、18: 301~500人、16: 501~1,000人、17: 1,001人以上
    attr_accessor :head_count

    # 法人番号 (半角数字13桁、法人のみ)
    attr_accessor :corporate_number

    attr_accessor :fiscal_years_attributes

    attr_accessor :doc_template

    # 仕訳番号形式（not_used: 使用しない、digits: 数字（例：5091824）、alnum: 英数字（例：59J0P））Available values : not_used, digits, alnum
    attr_accessor :txn_number_format

    # プライベート資金/役員資金（0: 使用しない、1: 使用する）
    attr_accessor :private_settlement

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
        :'name' => :'name',
        :'name_kana' => :'name_kana',
        :'contact_name' => :'contact_name',
        :'address_attributes' => :'address_attributes',
        :'phone1' => :'phone1',
        :'phone2' => :'phone2',
        :'fax' => :'fax',
        :'sales_information_attributes' => :'sales_information_attributes',
        :'head_count' => :'head_count',
        :'corporate_number' => :'corporate_number',
        :'fiscal_years_attributes' => :'fiscal_years_attributes',
        :'doc_template' => :'doc_template',
        :'txn_number_format' => :'txn_number_format',
        :'private_settlement' => :'private_settlement'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'name' => :'String',
        :'name_kana' => :'String',
        :'contact_name' => :'String',
        :'address_attributes' => :'CompanyParamsAddressAttributes',
        :'phone1' => :'String',
        :'phone2' => :'String',
        :'fax' => :'String',
        :'sales_information_attributes' => :'CompanyParamsSalesInformationAttributes',
        :'head_count' => :'Float',
        :'corporate_number' => :'String',
        :'fiscal_years_attributes' => :'CompanyParamsFiscalYearsAttributes',
        :'doc_template' => :'CompanyParamsDocTemplate',
        :'txn_number_format' => :'String',
        :'private_settlement' => :'Integer'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `UnofficialFreeeSdk::CompanyParams` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `UnofficialFreeeSdk::CompanyParams`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.key?(:'name_kana')
        self.name_kana = attributes[:'name_kana']
      end

      if attributes.key?(:'contact_name')
        self.contact_name = attributes[:'contact_name']
      end

      if attributes.key?(:'address_attributes')
        self.address_attributes = attributes[:'address_attributes']
      end

      if attributes.key?(:'phone1')
        self.phone1 = attributes[:'phone1']
      end

      if attributes.key?(:'phone2')
        self.phone2 = attributes[:'phone2']
      end

      if attributes.key?(:'fax')
        self.fax = attributes[:'fax']
      end

      if attributes.key?(:'sales_information_attributes')
        self.sales_information_attributes = attributes[:'sales_information_attributes']
      end

      if attributes.key?(:'head_count')
        self.head_count = attributes[:'head_count']
      end

      if attributes.key?(:'corporate_number')
        self.corporate_number = attributes[:'corporate_number']
      end

      if attributes.key?(:'fiscal_years_attributes')
        self.fiscal_years_attributes = attributes[:'fiscal_years_attributes']
      end

      if attributes.key?(:'doc_template')
        self.doc_template = attributes[:'doc_template']
      end

      if attributes.key?(:'txn_number_format')
        self.txn_number_format = attributes[:'txn_number_format']
      end

      if attributes.key?(:'private_settlement')
        self.private_settlement = attributes[:'private_settlement']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if !@name.nil? && @name.to_s.length > 100
        invalid_properties.push('invalid value for "name", the character length must be smaller than or equal to 100.')
      end

      if !@name_kana.nil? && @name_kana.to_s.length > 100
        invalid_properties.push('invalid value for "name_kana", the character length must be smaller than or equal to 100.')
      end

      if !@contact_name.nil? && @contact_name.to_s.length > 50
        invalid_properties.push('invalid value for "contact_name", the character length must be smaller than or equal to 50.')
      end

      if !@private_settlement.nil? && @private_settlement > 1
        invalid_properties.push('invalid value for "private_settlement", must be smaller than or equal to 1.')
      end

      if !@private_settlement.nil? && @private_settlement < 0
        invalid_properties.push('invalid value for "private_settlement", must be greater than or equal to 0.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@name.nil? && @name.to_s.length > 100
      return false if !@name_kana.nil? && @name_kana.to_s.length > 100
      return false if !@contact_name.nil? && @contact_name.to_s.length > 50
      head_count_validator = EnumAttributeValidator.new('Float', [0, 1, 2, 3, 13, 14, 15, 18, 16, 17])
      return false unless head_count_validator.valid?(@head_count)
      txn_number_format_validator = EnumAttributeValidator.new('String', ["not_used", "digits", "alnum"])
      return false unless txn_number_format_validator.valid?(@txn_number_format)
      return false if !@private_settlement.nil? && @private_settlement > 1
      return false if !@private_settlement.nil? && @private_settlement < 0
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] name Value to be assigned
    def name=(name)
      if !name.nil? && name.to_s.length > 100
        fail ArgumentError, 'invalid value for "name", the character length must be smaller than or equal to 100.'
      end

      @name = name
    end

    # Custom attribute writer method with validation
    # @param [Object] name_kana Value to be assigned
    def name_kana=(name_kana)
      if !name_kana.nil? && name_kana.to_s.length > 100
        fail ArgumentError, 'invalid value for "name_kana", the character length must be smaller than or equal to 100.'
      end

      @name_kana = name_kana
    end

    # Custom attribute writer method with validation
    # @param [Object] contact_name Value to be assigned
    def contact_name=(contact_name)
      if !contact_name.nil? && contact_name.to_s.length > 50
        fail ArgumentError, 'invalid value for "contact_name", the character length must be smaller than or equal to 50.'
      end

      @contact_name = contact_name
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] head_count Object to be assigned
    def head_count=(head_count)
      validator = EnumAttributeValidator.new('Float', [0, 1, 2, 3, 13, 14, 15, 18, 16, 17])
      unless validator.valid?(head_count)
        fail ArgumentError, "invalid value for \"head_count\", must be one of #{validator.allowable_values}."
      end
      @head_count = head_count
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] txn_number_format Object to be assigned
    def txn_number_format=(txn_number_format)
      validator = EnumAttributeValidator.new('String', ["not_used", "digits", "alnum"])
      unless validator.valid?(txn_number_format)
        fail ArgumentError, "invalid value for \"txn_number_format\", must be one of #{validator.allowable_values}."
      end
      @txn_number_format = txn_number_format
    end

    # Custom attribute writer method with validation
    # @param [Object] private_settlement Value to be assigned
    def private_settlement=(private_settlement)
      if !private_settlement.nil? && private_settlement > 1
        fail ArgumentError, 'invalid value for "private_settlement", must be smaller than or equal to 1.'
      end

      if !private_settlement.nil? && private_settlement < 0
        fail ArgumentError, 'invalid value for "private_settlement", must be greater than or equal to 0.'
      end

      @private_settlement = private_settlement
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          name == o.name &&
          name_kana == o.name_kana &&
          contact_name == o.contact_name &&
          address_attributes == o.address_attributes &&
          phone1 == o.phone1 &&
          phone2 == o.phone2 &&
          fax == o.fax &&
          sales_information_attributes == o.sales_information_attributes &&
          head_count == o.head_count &&
          corporate_number == o.corporate_number &&
          fiscal_years_attributes == o.fiscal_years_attributes &&
          doc_template == o.doc_template &&
          txn_number_format == o.txn_number_format &&
          private_settlement == o.private_settlement
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [name, name_kana, contact_name, address_attributes, phone1, phone2, fax, sales_information_attributes, head_count, corporate_number, fiscal_years_attributes, doc_template, txn_number_format, private_settlement].hash
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
