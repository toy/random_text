$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'random_text'

begin
  require 'spec'
rescue LoadError
  require 'rubygems'
  gem 'rspec'
  require 'spec'
end
