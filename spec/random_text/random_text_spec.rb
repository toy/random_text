require File.dirname(__FILE__) + '/../spec_helper.rb'

module RandomText
  describe RandomText do
    before :each do
      @text = %Q{
        Typi non habent claritatem insitam, est usus legentis in iis qui facit eorum claritatem.
        Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius!
        Claritas est etiam processus dynamicus, qui sequitur Brahmes mutationem consuetudium lectorum?
        Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.
      }
      @lorem = RandomText.new(@text)
    end

    WORD_R = /^\w+$/
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

    SENTENCE_RS = '\w+(,?\W\w+)+[.!?]'
    SENTENCE_R = /^#{SENTENCE_RS}$/
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
      PARAGRAPH_R = /(#{SENTENCE_RS} ){4}#{SENTENCE_RS}/
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
end
