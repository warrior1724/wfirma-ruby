# encoding: utf-8
require 'faraday'
require 'faraday_middleware'

class WFirma
  module Backend
    class Http
      module Middleware
        class DefaultParams < Faraday::Middleware
          # Append default parameters to any request

          def initialize(app, opts = nil)
            @default_params = opts || { 'inputFormat' => 'json', 'outputFormat' => 'json' }
            super(app)
          end

          def call(env)
            append_string = @default_params.map do |k,v|
              to_query(k,v)
            end.join('&')

            env[:url].query = if env[:url].query.to_s.size > 0
              [ env[:url].query, '&', append_string ].join
            else
              append_string
            end

            @app.call env
          end

          def to_query(key, value)
            "#{CGI.escape(key.to_s)}=#{CGI.escape(value.to_s)}"
          end

        end
      end
    end
  end
end

Faraday::Request.register_middleware wfirma_default_params: ->{
  WFirma::Backend::Http::Middleware::DefaultParams
}
