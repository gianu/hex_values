#!/usr/bin/env rake
require "bundler/gem_tasks"
require "rake"
require "rake/testtask"

Rake::TestTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.libs.push 'spec'
  t.verbose = true
end