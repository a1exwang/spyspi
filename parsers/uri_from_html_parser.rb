require 'nokogiri'
require 'open-uri'

class UriFromHtmlParser
  def initialize
    @pattern = /"(http:\/\/[^"]*)"/
  end

  def get_all_matched(html)
    html.scan(@pattern).map do |item|
      item.first
    end
  end
end