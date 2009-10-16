require File.dirname(__FILE__) + '/../spec_helper.rb'

WORD_R = /^\w+$/
SENTENCE_RS = '\w+([,;]?\W\w+)+[.!?]'
SENTENCE_R = /^#{SENTENCE_RS}$/
PARAGRAPH_R = /^(#{SENTENCE_RS} ){4}#{SENTENCE_RS}$/

Dictionary = RandomText::Dictionary
describe Dictionary do
  before :each do
    @text = %Q{
      Typi non habent claritatem insitam, est usus legentis in iis qui facit eorum claritatem.
      Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius!
      Claritas est etiam processus dynamicus, qui sequitur Brahmes mutationem consuetudium lectorum?
      Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.
    }
    @lorem = Dictionary.new(@text)
  end

  describe "getting word(s)" do

    it "should return word" do
      @lorem.word.should =~ WORD_R
    end

    it "should return n words" do
      words = @lorem.words(5)
      words.length.should == 5
      words.each{ |word| word.should =~ WORD_R }
    end

    it "should return all words" do
      words = @lorem.words
      words.length.should == 39
      words.each{ |word| word.should =~ WORD_R }
    end

    it "should return n uniq words" do
      words = @lorem.uniq_words(30)
      words.length.should == 30
      words.uniq.should == words
    end

    it "should return all uniq words (it is same as all words)" do
      words = @lorem.uniq_words
      words.length.should == 39
      words.uniq.should == words
    end
  end

  describe "getting sentence(s)" do
    it "should return sentence" do
      @lorem.sentence.should =~ SENTENCE_R
    end

    it "should return n sentences" do
      sentences = @lorem.sentences(10)
      sentences.length.should == 10
      sentences.each{ |sentence| sentence.should =~ SENTENCE_R }
    end

    it "should return all sentences" do
      sentences = @lorem.sentences
      sentences.length.should == 4
      sentences.each{ |sentence| sentence.should =~ SENTENCE_R }
    end
  end

  describe "paragraph(s)" do
    it "should return paragraph" do
      @lorem.paragraph.should =~ PARAGRAPH_R
    end

    it "should return n paragraphs" do
      paragraphs = @lorem.paragraphs(10)
      paragraphs.length.should == 10
      paragraphs.each{ |paragraph| paragraph.should =~ PARAGRAPH_R }
    end
  end
end

describe "binaries" do
  it "should return 1 paragraph by default" do
    IO.popen('bin/lorem', &:read).strip.should =~ PARAGRAPH_R
  end

  {
    %w(paragraph paragraphs p para) => PARAGRAPH_R,
    %w(sentence sentences s sent) => SENTENCE_R,
    %w(word words w) => WORD_R,
    %w(uniq_word uniq_words u uniq) => WORD_R,
  }.each do |specifiers, reg|
    specifiers.each do |specifier|
      describe "with specifier #{specifier}" do
        it "should return #{specifiers[0]}" do
          IO.popen("bin/lorem #{specifier}", &:read).strip.should =~ reg
        end

        it "should return 5 #{specifiers[1]}" do
          lines = IO.popen("bin/lorem 5 #{specifier}", &:readlines).map(&:strip)
          lines.length.should == 5
          lines.each{ |line| line.should =~ reg }
        end
      end
    end
  end
end
