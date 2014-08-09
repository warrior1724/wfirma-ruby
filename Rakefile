# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
require './lib/w_firma/version'

Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name        = "wfirma"
  gem.homepage    = ""
  gem.license     = "MIT"
  gem.summary     = %Q{Ruby wrapper for wFirma.pl API}
  gem.email       = "ernest@bzdury.pl"
  gem.authors     = ["Ernest Bursa"]
  gem.description = %Q{In progress: Ruby API wrapper for wFirma.pl}
  gem.version     = WFirma::Version::STRING
  # dependencies defined in Gemfile
end

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern    = FileList['spec/**/*_spec.rb']
  spec.rspec_opts = '--debug'
end

desc "Code coverage detail"
task :coverage do
  ENV['COVERAGE'] = 'true'
  Rake::Task['spec'].execute
end

task default: :coverage

require 'yard'
YARD::Rake::YardocTask.new
