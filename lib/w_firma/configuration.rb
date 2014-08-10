# encoding: utf-8
require 'active_support/configurable'

class WFirma::Configuration
  include ActiveSupport::Configurable

  config_accessor :login, :password,
                  :wfirma_api_url

  # Keys with default configuration
  config_accessor(:verbose) { false }

  def initialize(opts = {})
    yield self if block_given?
  end

end