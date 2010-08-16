# -*- coding: utf-8 -*-
require 'rubygems'
require 'open-uri'
require 'uri'
require 'nokogiri'
require 'kconv'
require 'net/http'

class Wikipedia

  def initialize(agent_name)
    @agent_name = agent_name
  end

  def random
    get('特別:おまかせ表示')
  end
  
  def get(name)
    doc = Nokogiri::HTML open(URI.encode("http://ja.wikipedia.org/wiki/#{name}"), 'User-Agent' => @agent_name).read.toutf8
    
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
