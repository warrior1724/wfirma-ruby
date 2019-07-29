  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
require File.expand_path('../lib/w_firma/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = "w_firma"
  gem.homepage    = ""
  gem.license     = "MIT"
  gem.summary     = %Q{Ruby wrapper for wFirma.pl API}
  gem.email       = "ernest@bzdury.pl"
  gem.authors     = ["Ernest Bursa"]
  gem.description = %Q{In progress: Ruby API wrapper for wFirma.pl}
  gem.version     = WFirma::Version::STRING
  # dependencies defined in Gemfile
  
  gem.require_paths = ['lib']
  #gem.files = %w[.yardopts CHANGELOG.md CONTRIBUTING.md LICENSE README.md UPGRADING.md]
  gem.files += %w[Rakefile w_firma.gemspec]
  gem.files += Dir['lib/**/*.rb']
  gem.files += Dir['spec/**/*.rb']
  gem.test_files = Dir['spec/**/*.rb']

  #gem.add_development_dependency 'rake', '< 11'
  #gem.add_development_dependency 'rspec', '~> 3.0'
  #gem.add_development_dependency 'rspec-pending_for', '~> 0.1'
end
  