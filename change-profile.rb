require 'tw'
require 'yaml'
require File.expand_path 'lib/wikipedia', File.dirname(__FILE__)

begin
  conf = YAML::load_file File.expand_path 'config.yaml', File.dirname(__FILE__)
rescue
  STDERR.puts 'config.yaml load error'
  exit 1
end

client = Tw::Client.new
client.auth conf['tw_user']

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
  if tmp.empty?
    puts "#{data[:name]} => empty"
  else
    desc = conf['your_name'] + tmp.join('')
    puts "#{data[:name]} => #{desc}"
    break
  end
end
exit if desc == nil or desc == conf['your_name']

Tw::Client.client.update_profile({'description' => desc})

if conf['tw_notify']
  notify = Tw::Client.new
  notify.auth conf['tw_notify']
  notify.tweet desc
end
