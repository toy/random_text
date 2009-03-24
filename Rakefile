require 'rubygems'
require 'rake'
require 'rake/clean'
require 'fileutils'
require 'echoe'

require File.dirname(__FILE__) + '/lib/random_text'

Echoe.new('random_text', RandomText::VERSION) do |p|
  p.author = "toy"
  p.summary = "A library to generate random strings."
  p.runtime_dependencies = ['activesupport >= 2.0.2']
end
