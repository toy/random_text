module RandomText
  class Dictionary
    def initialize(text)
      @words = RandomStrings.new(text.scan(/\w{3,}/u).
              collect{ |w| RandomText.downcase(w) }.
              reject{ |w| w =~ /^[0-9]/u }.
              uniq.map{ |w| w })
      @sentences = RandomStrings.new(text.split(/[\r\n]+/u).
              map(&:strip).compact.
              delete_if(&:empty?).uniq)
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

    def paragraph
      @sentences.get(5).join(' ')
    end

    def paragraphs(n)
      Array.new(n){ paragraph }
    end
  end
end
