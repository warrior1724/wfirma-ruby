# encoding: utf-8
# More info at https://github.com/guard/guard#readme

reload_support = lambda do |changed_paths|
  Dir["./spec/support/**/*.rb"].sort.each do |f|
    load(f)
  end
end

guard 'jruby-rspec', cli: ['--debug'], custom_reloaders: [ reload_support ] do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end

interactor :simple