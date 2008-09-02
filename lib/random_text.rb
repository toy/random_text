require 'rubygems'
require 'activesupport'

$KCODE = "u"

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
    def unique(n)
      raise "Dictionary has only #{@list.length} elements (you asked for n)" if n > @list.length
      @list.sort{ rand - 0.5 }.slice(0, n)
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

  def words(n)
    Array.new(n){ word }.join(' ').capitalize
  end
  
  def unique_words(n)
    @words.unique(n)
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
