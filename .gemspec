require 'rake'

src = "lib"
testdir = "spec"
    Gem::Specification.new do |s|
        s.name = "bwyamlconfig"
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
