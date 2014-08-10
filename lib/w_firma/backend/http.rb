# encoding: utf-8
require 'faraday'
require 'faraday_middleware'

class WFirma
  module Backend
    class Http
      DEFAULT_API_PATH = 'https://api2.wfirma.pl'

      require_relative 'http/errors'
      require_relative 'http/middleware/error_parser'
      require_relative 'http/middleware/default_params'

      def initialize(opts = {})
        @config = opts[:config] || WFirma::Configuration.new
      end

      # Cache connection instance
      def connection
        @connector ||= Faraday.new(url: api_base_url) do |conn|
          conn.request :wfirma_default_params
          conn.request :url_encoded
          conn.request :basic_auth, *authorization_data
          conn.request :json

          # Hell no, WFirma uses application/html header for jsons
          conn.response :json #, content_type: /\bjson$/
          conn.response :wfirma_error_parser
          conn.response :logger if @config.verbose

          conn.use :instrumentation
          conn.adapter Faraday.default_adapter
        end

        @connector.headers['Content-Type'] ||= content_type_string
        @connector.headers['User-Agent']   ||= user_agent_string

        @connector
      end

      alias :conn :connection

      # Return connection base url
      def api_base_url
        @config.wfirma_api_url || DEFAULT_API_PATH
      end

      def content_type_string
        'application/json'
      end

      # Return authorization data
      def authorization_data
        [ @config.login, @config.password ]
      end

      def user_agent_string
        @user_agent ||= "Ruby wFirma client #{WFirma::Version}"
      end

    end
  end
end