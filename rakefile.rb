require 'rake'
require 'rubygems'
require 'rake/gempackagetask'
require 'rspec/core/rake_task'

def with(value)
  yield(value)
end

with("spec") do |testdir|
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = FileList["#{testdir}/**/*_spec.rb"]
  end

  task :ci => [:spec, :clean_install]  

  task :clean_install => [:repackage, :install]

  with("bwyamlconfig") do |gemname|
    task :install do
      sh "gem install #{FileList['pkg/*.gem'].first()}"
      sh "gem cleanup #{gemname}"
    end

    with ("lib") do |src|
      spec = Gem::Specification.new do |s|
        s.name = gemname
        s.version = '1.0.1'
        s.summary = "Safely reads and merges 2 YAML configuration files"
        s.description = s.summary
        s.files = FileList["#{src}/**/*.rb",
                           "#{testdir}/**/*.rb"]
        s.test_files = FileList["#{testdir}/**/*.rb"]
        s.has_rdoc = false
        s.author = "Brady Wied"
        s.email = "brady@wied.us"
      end

      Rake::GemPackageTask.new(spec) do |pkg|
      end
    end
  end
end
