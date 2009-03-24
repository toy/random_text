$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'
require 'activesupport'

$KCODE = 'u'

require 'random_text/random_text'
require 'random_text/random_strings'

module RandomText
  VERSION = '0.0.5'

  def self.add_dictionary(path)
    const_name = File.basename(path, File.extname(path)).classify
    self.const_set(const_name, RandomText.new(File.read(path)))
  end
end

Dir.glob(File.join(File.dirname(__FILE__), '..', 'resources', '*.txt')) do |path|
  RandomText.add_dictionary(path)
end
