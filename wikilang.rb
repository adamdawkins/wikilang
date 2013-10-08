require 'open-uri'
require 'nokogiri'

class WikiLang 
  @@url = "http://omniglot.com/writing/languages.htm"

  def initialize
    @languages = []
    fetch_languages
  end

  def url
    @@url
  end

  def document
   Nokogiri::HTML(open(url))
  end

  def add_language? text
    if text.empty?
      false
    elsif text.split(" ").length > 2
      false
    elsif text.eql? "top"
      false
    else
      true
    end
  end
  def add_language text
    if add_language? text
      @languages << text
    end
  end

  def fetch_languages
    document.css('ol a').each do |a|
      add_language a.text
    end
  end
  
  def languages
    @languages
  end

end
