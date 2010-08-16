require 'rubygems'

desc 'run spec'
require 'spec'
require 'spec/rake/spectask'
Spec::Rake::SpecTask.new do |t|
  t.spec_opts = ['-c', '-fs']
  t.spec_files = Dir.glob(File.dirname(__FILE__)+'/spec/*_spec.rb')
end

task :default => [:spec]
