begin
  require 'jeweler'

  name = 'random_text'
  summary = 'Library to generate random strings'

  jewel = Jeweler::Tasks.new do |j|
    j.name = name
    j.summary = summary
    j.homepage = "http://github.com/toy/#{name}"
    j.authors = ['Ivan Kuchin']
  end

  Jeweler::GemcutterTasks.new

  require 'pathname'
  desc "Replace system gem with symlink to this folder"
  task 'ghost' do
    gem_path = Pathname(Gem.searcher.find(name).full_gem_path)
    current_path = Pathname('.').expand_path
    cmd = gem_path.writable? && gem_path.parent.writable? ? %w() : %w(sudo)
    system(*cmd + %W[rm -r #{gem_path}])
    system(*cmd + %W[ln -s #{current_path} #{gem_path}])
  end

rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end
task :default => :spec
