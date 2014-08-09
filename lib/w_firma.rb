# encoding: utf-8
require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

# Wrapper for WFirma.pl API
# Author: Ernest Bursa

class WFirma
  require 'w_firma/configuration'
  require 'w_firma/version'
  require 'w_firma/models'
  require 'w_firma/backend/http'

  attr_reader :backend, :config

  def initialize(opts = {})
    @config  = WFirma::Configuration.new(opts)
    @backend = WFirma::Backend::Http.new(config: @config)
  end

  def config
    if block_given?
      yield(@config.config)
    else
      @config
    end
  end
end