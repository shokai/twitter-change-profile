# -*- coding: utf-8 -*-
require File.dirname(__FILE__)+'/../lib/Wikipedia'

describe Wikipedia, 'get' do
  before(:all) do
    wiki = Wikipedia.new('shokai')
    @page = wiki.get('カレーライス')
  end

  it 'should have title' do
    @page[:title].class.should == String
  end

  it 'should have name' do
    @page[:name].class.should == String
  end

  it 'should have description' do
    @page[:description].class == Array
  end

  after(:all) do
    sleep 3
  end
end


