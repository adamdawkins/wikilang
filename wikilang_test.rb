require 'minitest/autorun'
require File.expand_path('../wikilang.rb', __FILE__)

describe WikiLang do
  subject { WikiLang.new }
  
  describe "#url" do
    it "should get the omniglot languages page" do
      subject.url.must_equal "http://omniglot.com/writing/languages.htm"
    end
  end

  describe "#document" do
    it "should be a NokoGiri::HTML document" do
      subject.document.must_be_kind_of Nokogiri::HTML::Document
    end
  end

  describe "#add_language" do
    it "adds a language to languages if the text is not empty" do
      subject.add_language "Chinese" 
      subject.languages.must_include "Chinese"
    end

    it "doesn't add a language if the  text is empty" do
      @lang_length = subject.languages.length
      subject.add_language ""
      subject.languages.length.must_equal @lang_length
    end

    it "doesn't add a language if it contains more than two words" do 
      @lang_length = subject.languages.length
      subject.add_language "Learn Chinese with omnitglot app"
      subject.languages.length.must_equal @lang_length
    end

    it "doesn't add a language if it is the word 'top'" do 
      @lang_length = subject.languages.length
      subject.add_language "top"
      subject.languages.length.must_equal @lang_length
    end
  end

  describe "#languages" do
    it "should be an array" do
      subject.languages.must_be_kind_of Array
    end
  end
end
