require File.dirname(__FILE__) + '/spec_helper.rb'

describe RandomText do
  it "should create RandomText objects for each text file" do
    Dir.glob(File.join(File.dirname(__FILE__), '..', 'resources', '*.txt')) do |path|
      RandomText.const_get(File.basename(path, File.extname(path)).classify).class.should == RandomText::RandomText
    end
  end
end
