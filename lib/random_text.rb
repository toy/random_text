# encoding: utf-8
$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'random_text/dictionary'
require 'random_text/random_strings'

module RandomText
  class << self
    def dictionaries
      @dictionaries ||= {}
    end

    def add_dictionary(path)
      const_name = classify(File.basename(path, File.extname(path)))
      dictionary = Dictionary.new(File.read(path))
      self.const_set(const_name, dictionary)
      dictionaries[const_name] = dictionary
    end

    def run(args)
      arg = args.join(' ').strip.downcase
      arg = 'p' if arg.empty?
      binary = File.basename($0)
      if m = arg.match(/^(\d+)?\s*(p|w|s|u)/)
        number = m[1] && m[1].to_i
        dictionary = dictionaries[classify(binary)]
        puts case m[2]
        when 'p'
          number ? dictionary.paragraphs(number) : dictionary.paragraph
        when 's'
          number ? dictionary.sentences(number) : dictionary.sentence
        when 'w'
          number ? dictionary.words(number) : dictionary.word
        when 'u'
          number ? dictionary.uniq_words(number) : dictionary.uniq_words
        end
      else
        abort <<-help
  #{binary} [specifier]
    without specifier returns one paragraph
    p, paragraph, s, sentence, w, word - one paragraph, sentence, word
    X p, X paragraph, X s, X sentence, X w, X word - X paragraphs, sentences, words
    u, uniq_words - all words
    X u, X uniq_words - X uniq_words
  help
      end
    end

    def classify(s)
      s.split('_').map(&:capitalize).join
    end

    OTHER_LOWER = 'абвгдеёжзийклмнопрстуфхцчшщъыьэюя'.scan(/./u)
    OTHER_UPPER = 'АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ'.scan(/./u)
    DOWNCASE_TABLE = Hash[*(OTHER_UPPER.zip(OTHER_LOWER)).flatten]

    def downcase(s)
      s.downcase.gsub(/./u){ |c| DOWNCASE_TABLE[c] || c }
    end
  end

  Dir.glob(File.join(File.dirname(__FILE__), '..', 'resources', '*.txt')) do |path|
    add_dictionary(path)
  end
end
