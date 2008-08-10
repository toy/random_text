require 'rubygems'
require 'activesupport'

class RandomText
  class Randomized
    def initialize(data)
      @list = data
    end
    def get
      s = @list.slice!(rand(@list.length))
      @list << s
      s
    end
  end

  def initialize(*args)
    data = [*args].flatten.join(' ')
    @words = Randomized.new(data.scan(/\w{4,}/).collect{ |w| w.chars.downcase.to_s }.uniq.map(&:chars))
    @sentences = Randomized.new(data.scan(/\S[^.]*\./m).uniq)
  end

  def word
    @words.get
  end
  
  def sentence
    @sentences.get
  end
  
  def sentences(n)
    Array.new(n){ sentence }.join(' ')
  end
end

require 'lorem'
require 'vesna'
