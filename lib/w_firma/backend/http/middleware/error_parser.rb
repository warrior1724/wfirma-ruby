# encoding: utf-8
require 'multi_json'
require 'faraday_middleware'
require 'faraday_middleware/response_middleware'
require_relative '../errors'

class WFirma
  module Backend
    class Http
      module Middleware
        class ErrorParser < ::Faraday::Response::Middleware

          # Oh no, WFirma returns 200 http status for 'not found'
          # etc....

          def initialize(app, options = {})
            super(app)
          end

          def parse(body)
            # WFirma returns errors as 200 OK
            json   = MultiJson.load(body) rescue nil
            if json && json['status']
              case json['status']['code']
              when 'NOT FOUND'
                raise WFirma::Backend::Http::Error::NotFound
              when 'ACTION NOT FOUND'
                raise WFirma::Backend::Http::Error::ActionNotFound
              when 'AUTH'
                raise WFirma::Backend::Http::Error::AuthenticationFailure
              when 'AUTH FAILED LIMIT WAIT 5 MINUTES'
                raise WFirma::Backend::Http::Error::AccessTemporaryDisabled
              when 'FATAL'
                raise WFirma::Backend::Http::Error::FatalError
              when 'INPUT ERROR'
                raise WFirma::Backend::Http::Error::InputError
              when 'ERROR'
                raise WFirma::Backend::Http::Error::OtherError
              when 'OUT OF SERVICE'
                raise WFirma::Backend::Http::Error::OutOfService
              when 'DENIED SCOPE REQUESTED'
                raise WFirma::Backend::Http::Error::DeniedScopeRequested
              end
            end

            body
          end
        end
      end
    end
  end
end

Faraday::Response.register_middleware wfirma_error_parser: ->{
  WFirma::Backend::Http::Middleware::ErrorParser
}