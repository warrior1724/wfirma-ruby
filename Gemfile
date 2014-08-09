source 'http://rubygems.org'

gem 'activesupport', '~> 4.1'
gem 'faraday'

# Add dependencies to develop your gem here.
# Include everything needed to run rake, tests, features, etc.
group :development do
  gem 'rspec', '~> 2.13'
  gem 'yard', '~> 0.7'
  gem 'rdoc', '~> 3.12'
  gem 'bundler', '~> 1.0'
  gem 'jeweler', '~> 2.0.1'
  gem 'simplecov', '>= 0'
  gem 'metric_fu'

  gem 'geminabox-rake'
  gem 'guard', '~> 1.8.3'
  gem 'guard-rspec', '~> 3.1.0'
  gem 'guard-jruby-rspec', github: 'jkutner/guard-jruby-rspec'
  gem 'terminal-notifier-guard'
  gem 'simplecov-json', require: false
end

group :development, :test do
  gem 'pry-remote'
  gem 'ruby-debug'
end