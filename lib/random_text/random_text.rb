module RandomText
  class RandomText
    def initialize(text)
      @words = RandomStrings.new(text.scan(/\w{3,}/).collect{ |w| w.mb_chars.downcase.to_s }.reject{ |w| w =~ /^[0-9]/ }.uniq.map(&:mb_chars))
      @sentences = RandomStrings.new(text.split(/[\r\n]+/).map(&:strip).compact.delete_if(&:blank?).uniq)
    end

    def word
      @words.get
    end

    def words(n = :all)
      @words.get(n)
    end

    def uniq_words(n = :all)
      @words.uniq(n)
    end
    alias_method :unique_words, :uniq_words

    def sentence
      @sentences.get
    end

    def sentences(n = :all)
      @sentences.get(n)
    end
  end
end
