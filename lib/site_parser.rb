require 'open-uri'

class SiteParser

  BASE_URL = "http://www.cadc.uscourts.gov/internet/opinions.nsf/OpinionsByRDate?OpenView&count=100&SKey="

  def self.call(*args)
    self.new(*args).parse
  end

  def initialize(year=Date.today.year, month=Date.today.month)
    @year     = year
    @month    = month
    @opinions = []
  end

  def parse
    doc = Nokogiri::HTML open(current_url)
    doc.css(".row-entry").each_slice(2) do |el|
      @opinions << {
        opinion_number: parse_opinion_number(el.first),
        title: parse_title(el.first),
        date:  parse_date(el.last)
      }
    end
    @opinions
  end

  def current_url
    "#{BASE_URL}#{@year}#{'%02d' % @month}"
  end

  private
  def parse_opinion_number el
    el.css(".column-one a").text
  end

  def parse_title el
    el.css(".column-two").text
  end

  def parse_date el
    el.css(".column-two").text
  end
end
