#!/usr/bin/env ruby
require File.dirname(__FILE__)+'/lib/wikipedia'

$KCODE = 'u'

w = Wikipedia.new('shokai')
p w.random
