require 'rest-client'
require 'json'

address_verification_url = YAML.load_file(Rails.root.join('config', 'api_endpoints.yml'))[Rails.env]['address_verification_url']
bsoft_api_endpoint       = YAML.load_file(Rails.root.join('config', 'api_endpoints.yml'))[Rails.env]['bsoft_api_url']
shipping_quotes_url          = YAML.load_file(Rails.root.join('config', 'api_endpoints.yml'))[Rails.env]['shipping_quotes']

#p address_verification_url.inspect

$address_api_endpoint = RestClient::Resource.new(address_verification_url, :open_timeout=>4, :timeout=>90, :headers=>{:accept=>:json, :content_type => :json})

$bsoft_api_endpoint   = RestClient::Resource.new(bsoft_api_endpoint, :open_timeout=>4, :timeout=>90, :headers=>{:accept=>:xml, :content_type => :xml})

$shipping_quotes_endpoint = RestClient::Resource.new(shipping_quotes_url, :open_timeout=>4, :timeout=>90, :headers=>{:accept=>:xml, :content_type => :xml})
