$LOAD_PATH.unshift 'lib'

require 'twss'

task :default => :test

desc "Run tests"
task :test do
  Dir['test/*_test.rb'].each do |f|
    require f
  end
end


desc "Build a gem"
task :gem => [ :test, :gemspec, :build ]

begin
  begin
    require 'jeweler'
  rescue LoadError
    puts "Jeweler not available. Install it with: "
    puts "gem install jeweler"
  end

  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "twss"
    gemspec.summary = "Pre-trained That's What She Said classifier"
    gemspec.description = %{Pre-trained "That's What She Said" bayes classifier.
      Given a string, returns true if it's a TWSS joke.  Pre-trained from
      Twitter #twss.  Let the twss mashups begin!}
    gemspec.email = "bvandenbos@gmail.com"
    gemspec.homepage = "http://github.com/bvandenbos/twss"
    gemspec.authors = ["Ben VandenBos"]
    gemspec.version = TWSS::Version

    gemspec.add_dependency "classifier", ">= 1.3.1"

    gemspec.add_development_dependency "jeweler"
    gemspec.add_development_dependency "twitter"
  end
end


desc "Push a new version to Gemcutter"
task :publish => [ :test, :gemspec, :build ] do
  system "git tag v#{TWSS::Version}"
  system "git push origin v#{TWSS::Version}"
  system "git push origin master"
  system "gem push pkg/twss-#{TWSS::Version}.gem"
  system "git clean -fd"
end
