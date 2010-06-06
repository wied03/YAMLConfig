require 'rake'
require 'rubygems'
require 'rake/gempackagetask'

spec = Gem::Specification.new do |s|
  s.name = 'yamlmerge'
  s.version = '1.0.0'
  s.summary = "Safely reads and merges 2 YAML configuration files"
  s.description = s.summary
  s.files = FileList['lib/**/*.rb', 'test/**/*.rb']
  s.test_files = FileList['test/**/*.rb']
  s.has_rdoc = false
  s.author = "Brady Wied"
  s.email = "brady@wied.us"
end

Rake::GemPackageTask.new(spec) do |pkg|
end 