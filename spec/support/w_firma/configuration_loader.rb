# encoding: utf-8
# This is simple configuration loader to keep
# repository clean from API credentials
require 'yaml'

class TestingConfiguration
  class << self
    def instance
      @config ||= WFirma::Configuration.new do |config|
        config_path = File.expand_path(File.join(File.dirname(__FILE__), '../../w_firma.yml'))

        if File.exists?(config_path)
          data = YAML.load_file(config_path)['test']

          config.login    = data['login']
          config.password = data['password']
        else
          raise Exception, "Please create configuration file #{config_pat}} before running specs"
        end
      end
    end
  end
end

# Preload configuration to memory
VCR.configure do |c|
  c.filter_sensitive_data('API_LOGIN')    { TestingConfiguration.instance.login             }
  c.filter_sensitive_data('API_LOGIN')    { CGI.escape(TestingConfiguration.instance.login) }
  c.filter_sensitive_data('API_PASSWORD') { TestingConfiguration.instance.password          }
  c.filter_sensitive_data('SESSION_COOKIE') do |interaction|
    cookies = interaction.response.headers['set-cookie']
    if cookies && cookies.is_a?(Array)
      cookies.first
    end
  end
end