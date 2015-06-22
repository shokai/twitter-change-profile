require 'uri'
require 'nokogiri'
require 'httparty'

class Wikipedia
  def initialize(agent_name)
    @agent_name = agent_name
  end

  def random
    get('特別:おまかせ表示')
  end

  def get(name)
    res = HTTParty.get URI.encode("http://ja.wikipedia.org/wiki/#{name}"), {
      "User-Agent" => @agent_name
    }

    doc = Nokogiri::HTML res.body

    title = doc.xpath('//title').first.text
    name = doc.xpath('//h1').first.text
    descriptions = doc.xpath('//div[@id="bodyContent"]//p').map{|i|i.text}
    {
      :title => title,
      :name => name,
      :descriptions => descriptions
    }
  end
end

if __FILE__ == $0
  require 'bundler/setup'
  w = Wikipedia.new 'test'
  p w.random
end
