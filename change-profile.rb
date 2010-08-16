#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'rubygems'
require 'twitter'
require 'yaml'
require File.dirname(__FILE__)+'/lib/wikipedia'
$KCODE = 'u'

begin
  conf = YAML::load open(File.dirname(__FILE__) + '/config.yaml')
rescue
  STDERR.puts 'config.yaml load error'
  exit 1
end

tw = Twitter::Base.new(Twitter::HTTPAuth.new(conf['name'], conf['pass']))
w = Wikipedia.new('shokai')
desc = nil
5.times do
  data = w.random
  
  desc = data[:descriptions].first
  desc.gsub!(/\[\d+\]/, '')
  tmp = desc.split(/(と?は)/)
  left = tmp.shift
  while left =~ /（[^）]+$/ do
    tmp.shift
    left = tmp.shift
  end
  desc = conf['your_name']+tmp.join('')
  puts '-'*10
  print data[:name] + ' => '
  puts desc
  break if desc != conf['your_name']
end
exit if desc == nil or desc == conf['your_name']

tw.update_profile({'description' => desc})
