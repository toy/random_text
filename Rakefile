require 'rubygems'
require 'rake'
require 'rake/clean'
require 'fileutils'
require 'echoe'

load 'tasks/rspec.rake'

task :default => :spec
task :test

version = YAML.load_file(File.join(File.dirname(__FILE__), 'VERSION.yml')).join('.') rescue nil

Echoe.new('random_text', version) do |p|
  p.author = "toy"
  p.summary = "A library to generate random strings."
  p.runtime_dependencies = ['activesupport']
end
