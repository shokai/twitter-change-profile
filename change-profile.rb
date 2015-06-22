require 'twitter'
require 'yaml'
require File.expand_path 'lib/wikipedia', File.dirname(__FILE__)

begin
  conf = YAML::load_file File.expand_path 'config.yaml', File.dirname(__FILE__)
rescue
  STDERR.puts 'config.yaml load error'
  exit 1
end


twitter = Twitter::REST::Client.new do |c|
  c.consumer_key = conf['consumer_key']
  c.consumer_secret = conf['consumer_secret']
  c.access_token = conf['access_token']
  c.access_token_secret = conf['access_secret']
end

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
  desc = conf['your_name'] + tmp.join('')
  puts '-'*10
  print data[:name] + ' => '
  puts desc
  break if desc != conf['your_name']
end
exit if desc == nil or desc == conf['your_name']

twitter.update_profile({'description' => desc})

puts cmd = "echo #{desc} | #{conf['tweet_cmd']}"
system cmd
