# encoding: utf-8
require 'faraday'

class WFirma
  module Backend
    class Http
      DEFAULT_API_PATH = 'https://api2.wfirma.pl'

      def initialize(opts = {})
        @config = opts[:config] || WFirma::Configuration.new
      end

      # Cache connection instance
      def connection
        @connector ||= Faraday.new(url: api_base_uri) do |conn|
          conn.request  :url_encoded
          conn.adapter  Faraday.default_adapter

          conn.response :json, content_type: /\bjson$/
          conn.response :logger if @config.verbose

          conn.use :instrumentation
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

      def user_agent_string
        @user_agent ||= "Ruby wFirma client #{WFirma::Version}"
      end

    end
  end
end