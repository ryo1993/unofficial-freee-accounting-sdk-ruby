require 'rubygems'
require 'bundler/setup'
require 'unofficial_freee_sdk'

ACCESS_TOKEN = ''
abort('ACCESS_TOKEN を設定してください。') if ACCESS_TOKEN == ''

# Setup authorization
UnofficialFreeeSdk.configure do |config|
  # Configure OAuth2 access token for authorization: oauth2
  config.access_token = ACCESS_TOKEN
end

api_instance = UnofficialFreeeSdk::CompaniesApi.new

begin
  #事業所一覧の取得
  data = api_instance.get_companies
  companies = data.companies

  p "事業所名一覧：#{companies.map(&:display_name).join(', ')}"
rescue UnofficialFreeeSdk::ApiError => e
  puts "Exception when calling CompaniesApi->get_companies: #{e}"
end
