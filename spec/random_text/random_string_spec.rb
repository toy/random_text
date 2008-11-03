require File.dirname(__FILE__) + '/../spec_helper.rb'

module RandomText
  describe RandomStrings do
    before :each do
      @words = %w(Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua)
      @random_words = RandomStrings.new(@words)
    end

    it "should be equal to initialization array" do
      @random_words.should == @words
    end

    describe "with get" do
      it "should return word" do
        @random_words.get.should =~ /^\w+$/
      end
    end

    describe "with get(n)" do
      it "should return words" do
        @random_words.get(10).all?{ |w| w.should =~ /^\w+$/ }
      end

      it "should return n words" do
        @random_words.get(10).length.should == 10
      end
    end

    describe "with uniq(n)" do
      it "should return words" do
        @random_words.uniq(10).all?{ |w| w.should =~ /^\w+$/ }
      end

      it "should return n words" do
        @random_words.uniq(10).length.should == 10
      end

      it "should return n uniq words" do
        @random_words.uniq(10).uniq.length.should == 10
      end
    end
  end
end
