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

  it 'should have descriptions' do
    @page[:descriptions].class == Array
  end

  after(:all) do
    sleep 1
  end
end


describe Wikipedia, 'random' do
  before(:all) do
    @wiki = Wikipedia.new('shokai')
    @page = @wiki.random
  end

  it 'should be random' do
    page2 = @wiki.random
    @page[:name].should_not == page2[:name]
  end

  after(:all) do
    sleep 1
  end
end

