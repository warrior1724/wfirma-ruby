require 'simplecov'
require 'simplecov-json'
require 'metric_fu/metrics/rcov/simplecov_formatter'

module SimpleCov::Configuration
  def clean_filters
    @filters = []
  end
end

if ENV['COVERAGE']
  SimpleCov.configure do
    SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
        SimpleCov::Formatter::HTMLFormatter
    ]
  end

  SimpleCov.adapters.define 'gem' do
    # add_filter '/spec/'
    add_filter '/test/'
    add_filter '/features/'
    add_filter '/autotest/'
    add_filter "/.rvm/"

    add_group 'Libraries', '/lib/'
    add_group 'Binaries', '/bin/'
    add_group 'Extensions', '/ext/'
    add_group 'Vendor Libraries', '/vendor/'
  end

  SimpleCov.start 'gem'
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

Bundler.require(:default, :test)

require 'rspec'
require 'w_firma'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["./spec/support/**/*.rb"].sort.each { |f| require(f) }

class WFirma::Gem
  def self.root
    @app_path ||= File.expand_path(File.join(File.dirname(__FILE__), '..'))
  end
end

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
end