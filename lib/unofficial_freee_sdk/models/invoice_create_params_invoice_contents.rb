=begin
#freee API

# <h1 id=\"freee_api\">freee API</h1> <hr /> <h2 id=\"\">スタートガイド</h2>  <p>freee API開発がはじめての方は<a href=\"https://developer.freee.co.jp/getting-started\">freee API スタートガイド</a>を参照してください。</p>  <hr /> <h2 id=\"_2\">仕様</h2>  <h3 id=\"api\">APIエンドポイント</h3>  <p>https://api.freee.co.jp/ (httpsのみ)</p>  <h3 id=\"_3\">認証方式</h3>  <p><a href=\"http://tools.ietf.org/html/rfc6749\">OAuth2</a>に対応</p>  <ul> <li>Authorization Code Flow (Webアプリ向け)</li>  <li>Implicit Flow (Mobileアプリ向け)</li> </ul>  <h3 id=\"_4\">認証エンドポイント</h3>  <p>https://accounts.secure.freee.co.jp/</p>  <ul> <li>authorize : https://accounts.secure.freee.co.jp/public_api/authorize</li>  <li>token : https://accounts.secure.freee.co.jp/public_api/token</li> </ul>  <h3 id=\"_5\">アクセストークンのリフレッシュ</h3>  <p>認証時に得たrefresh_token を使ってtoken の期限をリフレッシュして新規に発行することが出来ます。</p>  <p>grant_type=refresh_token で https://accounts.secure.freee.co.jp/public_api/token にアクセスすればリフレッシュされます。</p>  <p>e.g.)</p>  <p>POST: https://accounts.secure.freee.co.jp/public_api/token</p>  <p>params: grant_type=refresh_token&amp;client_id=UID&amp;client_secret=SECRET&amp;refresh_token=REFRESH_TOKEN</p>  <p>詳細は<a href=\"https://github.com/applicake/doorkeeper/wiki/Enable-Refresh-Token-Credentials#flow\">refresh_token</a>を参照下さい。</p>  <h3 id=\"_6\">アクセストークンの破棄</h3>  <p>認証時に得たaccess_tokenまたはrefresh_tokenを使って、tokenを破棄することができます。 token=access_tokenまたはtoken=refresh_tokenでhttps://accounts.secure.freee.co.jp/public_api/revokeにアクセスすると破棄されます。token_type_hintでaccess_tokenまたはrefresh_tokenを陽に指定できます。</p>  <p>e.g.)</p>  <p>POST: https://accounts.secure.freee.co.jp/public_api/revoke</p>  <p>params: token=ACCESS_TOKEN</p>  <p>または</p>  <p>params: token=REFRESH_TOKEN</p>  <p>または</p>  <p>params: token=ACCESS_TOKEN&amp;token_type_hint=access_token</p>  <p>または</p>  <p>params: token=REFRESH_TOKEN&amp;token_type_hint=refresh_token</p>  <p>詳細は <a href=\"https://tools.ietf.org/html/rfc7009\">OAuth 2.0 Token revocation</a> をご参照ください。</p>  <h3 id=\"_7\">データフォーマット</h3>  <p>リクエスト、レスポンスともにJSON形式をサポート</p>  <h3 id=\"_8\">後方互換性ありの変更</h3>  <p>freeeでは、APIを改善していくために以下のような変更は後方互換性ありとして通知なく変更を入れることがあります。アプリケーション実装者は以下を踏まえて開発を行ってください。</p>  <ul> <li>新しいAPIリソース・エンドポイントの追加</li> <li>既存のAPIに対して必須ではない新しいリクエストパラメータの追加</li> <li>既存のAPIレスポンスに対する新しいプロパティの追加</li> <li>既存のAPIレスポンスに対するプロパティの順番の入れ変え</li> <li>keyとなっているidやcodeの長さの変更（長くする）</li> </ul>  <h3 id=\"_9\">共通レスポンスヘッダー</h3>  <p>すべてのAPIのレスポンスには以下のHTTPヘッダーが含まれます。</p>  <ul> <li> <p>X-Freee-Request-ID</p> <ul> <li>各リクエスト毎に発行されるID</li> </ul> </li> </ul>  <h3 id=\"_10\">共通エラーレスポンス</h3>  <ul> <li> <p>ステータスコードはレスポンス内のJSONに含まれる他、HTTPヘッダにも含まれる</p> </li>  <li> <p>type</p>  <ul> <li>status : HTTPステータスコードの説明</li>  <li>validation : エラーの詳細の説明（開発者向け）</li> </ul> </li> </ul>  <p>レスポンスの例</p>  <pre><code>  {     &quot;status_code&quot; : 400,     &quot;errors&quot; : [       {         &quot;type&quot; : &quot;status&quot;,         &quot;messages&quot; : [&quot;不正なリクエストです。&quot;]       },       {         &quot;type&quot; : &quot;validation&quot;,         &quot;messages&quot; : [&quot;Date は不正な日付フォーマットです。入力例：2013-01-01&quot;]       }     ]   }</code></pre>  </br>  <h3 id=\"_11\">API使用制限</h3>    <p>freeeは一定期間に過度のアクセスを検知した場合、APIアクセスをコントロールする場合があります。</p>   <p>その際のhttp status codeは403となります。制限がかかってから10分程度が過ぎると再度使用することができるようになります。</p>  <h4 id=\"_12\">/reportsエンドポイント</h4>  <p>freeeは/reportsエンドポイントに対して1秒間に10以上のアクセスを検知した場合、APIアクセスをコントロールする場合があります。その際のhttp status codeは429（too many requests）となります。</p>  <p>レスポンスボディのmetaプロパティに以下を含めます。</p>  <ul>   <li>設定されている上限値</li>   <li>上限に達するまでの使用可能回数</li>   <li>（上限値に達した場合）使用回数がリセットされる時刻</li> </ul>  <h3 id=\"_13\">プラン別のAPI Rate Limit</h3>   <table border=\"1\">     <tbody>       <tr>         <th style=\"padding: 10px\"><strong>会計freeeプラン名</strong></th>         <th style=\"padding: 10px\"><strong>事業所とアプリケーション毎に1日でのAPIコール数</strong></th>       </tr>       <tr>         <td style=\"padding: 10px\">エンタープライズ</td>         <td style=\"padding: 10px\">10,000</td>       </tr>       <tr>         <td style=\"padding: 10px\">プロフェッショナル</td>         <td style=\"padding: 10px\">5,000</td>       </tr>       <tr>         <td style=\"padding: 10px\">ベーシック</td>         <td style=\"padding: 10px\">3,000</td>       </tr>       <tr>         <td style=\"padding: 10px\">ミニマム</td>         <td style=\"padding: 10px\">3,000</td>       </tr>       <tr>         <td style=\"padding: 10px\">上記以外</td>         <td style=\"padding: 10px\">3,000</td>       </tr>     </tbody>   </table>  <hr /> <h2 id=\"_14\">連絡先</h2>  <p>ご不明点、ご要望等は <a href=\"https://support.freee.co.jp/hc/ja/requests/new\">freee サポートデスクへのお問い合わせフォーム</a> からご連絡ください。</p> <hr />&copy; Since 2013 freee K.K.

The version of the OpenAPI document: v1.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.2.3

=end

require 'date'

module UnofficialFreeeSdk
  class InvoiceCreateParamsInvoiceContents
    # 順序
    attr_accessor :order

    # 行の種類
    attr_accessor :type

    # 数量
    attr_accessor :qty

    # 単位
    attr_accessor :unit

    # 単価 (tax_entry_method: inclusiveの場合は税込価格、tax_entry_method: exclusiveの場合は税抜価格となります)
    attr_accessor :unit_price

    # 消費税額
    attr_accessor :vat

    # 備考
    attr_accessor :description

    # 勘定科目ID
    attr_accessor :account_item_id

    # 税区分ID
    attr_accessor :tax_code

    # 品目ID
    attr_accessor :item_id

    # 部門ID
    attr_accessor :section_id

    attr_accessor :tag_ids

    # セグメント１ID
    attr_accessor :segment_1_tag_id

    # セグメント２ID
    attr_accessor :segment_2_tag_id

    # セグメント３ID
    attr_accessor :segment_3_tag_id

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
        :'order' => :'order',
        :'type' => :'type',
        :'qty' => :'qty',
        :'unit' => :'unit',
        :'unit_price' => :'unit_price',
        :'vat' => :'vat',
        :'description' => :'description',
        :'account_item_id' => :'account_item_id',
        :'tax_code' => :'tax_code',
        :'item_id' => :'item_id',
        :'section_id' => :'section_id',
        :'tag_ids' => :'tag_ids',
        :'segment_1_tag_id' => :'segment_1_tag_id',
        :'segment_2_tag_id' => :'segment_2_tag_id',
        :'segment_3_tag_id' => :'segment_3_tag_id'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'order' => :'Integer',
        :'type' => :'String',
        :'qty' => :'Float',
        :'unit' => :'String',
        :'unit_price' => :'Float',
        :'vat' => :'Integer',
        :'description' => :'String',
        :'account_item_id' => :'Integer',
        :'tax_code' => :'Integer',
        :'item_id' => :'Integer',
        :'section_id' => :'Integer',
        :'tag_ids' => :'Array<Integer>',
        :'segment_1_tag_id' => :'Integer',
        :'segment_2_tag_id' => :'Integer',
        :'segment_3_tag_id' => :'Integer'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'vat',
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `UnofficialFreeeSdk::InvoiceCreateParamsInvoiceContents` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `UnofficialFreeeSdk::InvoiceCreateParamsInvoiceContents`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'order')
        self.order = attributes[:'order']
      end

      if attributes.key?(:'type')
        self.type = attributes[:'type']
      end

      if attributes.key?(:'qty')
        self.qty = attributes[:'qty']
      end

      if attributes.key?(:'unit')
        self.unit = attributes[:'unit']
      end

      if attributes.key?(:'unit_price')
        self.unit_price = attributes[:'unit_price']
      end

      if attributes.key?(:'vat')
        self.vat = attributes[:'vat']
      end

      if attributes.key?(:'description')
        self.description = attributes[:'description']
      end

      if attributes.key?(:'account_item_id')
        self.account_item_id = attributes[:'account_item_id']
      end

      if attributes.key?(:'tax_code')
        self.tax_code = attributes[:'tax_code']
      end

      if attributes.key?(:'item_id')
        self.item_id = attributes[:'item_id']
      end

      if attributes.key?(:'section_id')
        self.section_id = attributes[:'section_id']
      end

      if attributes.key?(:'tag_ids')
        if (value = attributes[:'tag_ids']).is_a?(Array)
          self.tag_ids = value
        end
      end

      if attributes.key?(:'segment_1_tag_id')
        self.segment_1_tag_id = attributes[:'segment_1_tag_id']
      end

      if attributes.key?(:'segment_2_tag_id')
        self.segment_2_tag_id = attributes[:'segment_2_tag_id']
      end

      if attributes.key?(:'segment_3_tag_id')
        self.segment_3_tag_id = attributes[:'segment_3_tag_id']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @order.nil?
        invalid_properties.push('invalid value for "order", order cannot be nil.')
      end

      if @order > 2147483647
        invalid_properties.push('invalid value for "order", must be smaller than or equal to 2147483647.')
      end

      if @order < 0
        invalid_properties.push('invalid value for "order", must be greater than or equal to 0.')
      end

      if @type.nil?
        invalid_properties.push('invalid value for "type", type cannot be nil.')
      end

      if !@qty.nil? && @qty > 999999999999
        invalid_properties.push('invalid value for "qty", must be smaller than or equal to 999999999999.')
      end

      if !@qty.nil? && @qty < 1
        invalid_properties.push('invalid value for "qty", must be greater than or equal to 1.')
      end

      if !@unit_price.nil? && @unit_price > 999999999999
        invalid_properties.push('invalid value for "unit_price", must be smaller than or equal to 999999999999.')
      end

      if !@unit_price.nil? && @unit_price < -999999999999
        invalid_properties.push('invalid value for "unit_price", must be greater than or equal to -999999999999.')
      end

      if !@account_item_id.nil? && @account_item_id > 999999999999
        invalid_properties.push('invalid value for "account_item_id", must be smaller than or equal to 999999999999.')
      end

      if !@account_item_id.nil? && @account_item_id < 1
        invalid_properties.push('invalid value for "account_item_id", must be greater than or equal to 1.')
      end

      if !@tax_code.nil? && @tax_code > 999999999999
        invalid_properties.push('invalid value for "tax_code", must be smaller than or equal to 999999999999.')
      end

      if !@tax_code.nil? && @tax_code < 0
        invalid_properties.push('invalid value for "tax_code", must be greater than or equal to 0.')
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

      if !@segment_1_tag_id.nil? && @segment_1_tag_id > 999999999999
        invalid_properties.push('invalid value for "segment_1_tag_id", must be smaller than or equal to 999999999999.')
      end

      if !@segment_1_tag_id.nil? && @segment_1_tag_id < 1
        invalid_properties.push('invalid value for "segment_1_tag_id", must be greater than or equal to 1.')
      end

      if !@segment_2_tag_id.nil? && @segment_2_tag_id > 999999999999
        invalid_properties.push('invalid value for "segment_2_tag_id", must be smaller than or equal to 999999999999.')
      end

      if !@segment_2_tag_id.nil? && @segment_2_tag_id < 1
        invalid_properties.push('invalid value for "segment_2_tag_id", must be greater than or equal to 1.')
      end

      if !@segment_3_tag_id.nil? && @segment_3_tag_id > 999999999999
        invalid_properties.push('invalid value for "segment_3_tag_id", must be smaller than or equal to 999999999999.')
      end

      if !@segment_3_tag_id.nil? && @segment_3_tag_id < 1
        invalid_properties.push('invalid value for "segment_3_tag_id", must be greater than or equal to 1.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @order.nil?
      return false if @order > 2147483647
      return false if @order < 0
      return false if @type.nil?
      type_validator = EnumAttributeValidator.new('String', ["normal", "discount", "text"])
      return false unless type_validator.valid?(@type)
      return false if !@qty.nil? && @qty > 999999999999
      return false if !@qty.nil? && @qty < 1
      return false if !@unit_price.nil? && @unit_price > 999999999999
      return false if !@unit_price.nil? && @unit_price < -999999999999
      return false if !@account_item_id.nil? && @account_item_id > 999999999999
      return false if !@account_item_id.nil? && @account_item_id < 1
      return false if !@tax_code.nil? && @tax_code > 999999999999
      return false if !@tax_code.nil? && @tax_code < 0
      return false if !@item_id.nil? && @item_id > 999999999999
      return false if !@item_id.nil? && @item_id < 1
      return false if !@section_id.nil? && @section_id > 999999999999
      return false if !@section_id.nil? && @section_id < 1
      return false if !@segment_1_tag_id.nil? && @segment_1_tag_id > 999999999999
      return false if !@segment_1_tag_id.nil? && @segment_1_tag_id < 1
      return false if !@segment_2_tag_id.nil? && @segment_2_tag_id > 999999999999
      return false if !@segment_2_tag_id.nil? && @segment_2_tag_id < 1
      return false if !@segment_3_tag_id.nil? && @segment_3_tag_id > 999999999999
      return false if !@segment_3_tag_id.nil? && @segment_3_tag_id < 1
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] order Value to be assigned
    def order=(order)
      if order.nil?
        fail ArgumentError, 'order cannot be nil'
      end

      if order > 2147483647
        fail ArgumentError, 'invalid value for "order", must be smaller than or equal to 2147483647.'
      end

      if order < 0
        fail ArgumentError, 'invalid value for "order", must be greater than or equal to 0.'
      end

      @order = order
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      validator = EnumAttributeValidator.new('String', ["normal", "discount", "text"])
      unless validator.valid?(type)
        fail ArgumentError, "invalid value for \"type\", must be one of #{validator.allowable_values}."
      end
      @type = type
    end

    # Custom attribute writer method with validation
    # @param [Object] qty Value to be assigned
    def qty=(qty)
      if !qty.nil? && qty > 999999999999
        fail ArgumentError, 'invalid value for "qty", must be smaller than or equal to 999999999999.'
      end

      if !qty.nil? && qty < 1
        fail ArgumentError, 'invalid value for "qty", must be greater than or equal to 1.'
      end

      @qty = qty
    end

    # Custom attribute writer method with validation
    # @param [Object] unit_price Value to be assigned
    def unit_price=(unit_price)
      if !unit_price.nil? && unit_price > 999999999999
        fail ArgumentError, 'invalid value for "unit_price", must be smaller than or equal to 999999999999.'
      end

      if !unit_price.nil? && unit_price < -999999999999
        fail ArgumentError, 'invalid value for "unit_price", must be greater than or equal to -999999999999.'
      end

      @unit_price = unit_price
    end

    # Custom attribute writer method with validation
    # @param [Object] account_item_id Value to be assigned
    def account_item_id=(account_item_id)
      if !account_item_id.nil? && account_item_id > 999999999999
        fail ArgumentError, 'invalid value for "account_item_id", must be smaller than or equal to 999999999999.'
      end

      if !account_item_id.nil? && account_item_id < 1
        fail ArgumentError, 'invalid value for "account_item_id", must be greater than or equal to 1.'
      end

      @account_item_id = account_item_id
    end

    # Custom attribute writer method with validation
    # @param [Object] tax_code Value to be assigned
    def tax_code=(tax_code)
      if !tax_code.nil? && tax_code > 999999999999
        fail ArgumentError, 'invalid value for "tax_code", must be smaller than or equal to 999999999999.'
      end

      if !tax_code.nil? && tax_code < 0
        fail ArgumentError, 'invalid value for "tax_code", must be greater than or equal to 0.'
      end

      @tax_code = tax_code
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

    # Custom attribute writer method with validation
    # @param [Object] segment_1_tag_id Value to be assigned
    def segment_1_tag_id=(segment_1_tag_id)
      if !segment_1_tag_id.nil? && segment_1_tag_id > 999999999999
        fail ArgumentError, 'invalid value for "segment_1_tag_id", must be smaller than or equal to 999999999999.'
      end

      if !segment_1_tag_id.nil? && segment_1_tag_id < 1
        fail ArgumentError, 'invalid value for "segment_1_tag_id", must be greater than or equal to 1.'
      end

      @segment_1_tag_id = segment_1_tag_id
    end

    # Custom attribute writer method with validation
    # @param [Object] segment_2_tag_id Value to be assigned
    def segment_2_tag_id=(segment_2_tag_id)
      if !segment_2_tag_id.nil? && segment_2_tag_id > 999999999999
        fail ArgumentError, 'invalid value for "segment_2_tag_id", must be smaller than or equal to 999999999999.'
      end

      if !segment_2_tag_id.nil? && segment_2_tag_id < 1
        fail ArgumentError, 'invalid value for "segment_2_tag_id", must be greater than or equal to 1.'
      end

      @segment_2_tag_id = segment_2_tag_id
    end

    # Custom attribute writer method with validation
    # @param [Object] segment_3_tag_id Value to be assigned
    def segment_3_tag_id=(segment_3_tag_id)
      if !segment_3_tag_id.nil? && segment_3_tag_id > 999999999999
        fail ArgumentError, 'invalid value for "segment_3_tag_id", must be smaller than or equal to 999999999999.'
      end

      if !segment_3_tag_id.nil? && segment_3_tag_id < 1
        fail ArgumentError, 'invalid value for "segment_3_tag_id", must be greater than or equal to 1.'
      end

      @segment_3_tag_id = segment_3_tag_id
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          order == o.order &&
          type == o.type &&
          qty == o.qty &&
          unit == o.unit &&
          unit_price == o.unit_price &&
          vat == o.vat &&
          description == o.description &&
          account_item_id == o.account_item_id &&
          tax_code == o.tax_code &&
          item_id == o.item_id &&
          section_id == o.section_id &&
          tag_ids == o.tag_ids &&
          segment_1_tag_id == o.segment_1_tag_id &&
          segment_2_tag_id == o.segment_2_tag_id &&
          segment_3_tag_id == o.segment_3_tag_id
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [order, type, qty, unit, unit_price, vat, description, account_item_id, tax_code, item_id, section_id, tag_ids, segment_1_tag_id, segment_2_tag_id, segment_3_tag_id].hash
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
