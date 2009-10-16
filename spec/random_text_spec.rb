# encoding: utf-8
require File.dirname(__FILE__) + '/spec_helper.rb'

describe RandomText do
  it "should create RandomText objects for each text file" do
    Dir.glob(File.join(File.dirname(__FILE__), '..', 'resources', '*.txt')) do |path|
      RandomText.const_get(RandomText.classify(File.basename(path, File.extname(path)))).class.should == RandomText::Dictionary
    end
  end

  it "should classify" do
    RandomText.classify('hello_world').should == 'HelloWorld'
  end

  it "should downcase" do
    RandomText.downcase('ABCDEFGHIJKLMNOPQRSTUVWXYZ-АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ:abcdefghijklmnopqrstuvwxyz-абвгдеёжзийклмнопрстуфхцчшщъыьэюя').should ==
                        'abcdefghijklmnopqrstuvwxyz-абвгдеёжзийклмнопрстуфхцчшщъыьэюя:abcdefghijklmnopqrstuvwxyz-абвгдеёжзийклмнопрстуфхцчшщъыьэюя'
  end
end
