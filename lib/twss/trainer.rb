#require 'twitter'

class TWSS

  class Trainer

    attr_reader :engine

    def initialize(engine, options = {})
      @engine = engine
      engine.clear_state!
      @training_set_size = options[:training_set_size] || 100
    end

    def train
      path = File.join(File.dirname(__FILE__), '../../data/')

      puts "Training NON-TWSS strings..."
      File.read(File.join(path, 'non_twss.txt')).each_line do |l|
        engine.train(TWSS::Engine::FALSE, strip_tweet(l))
      end

      puts "Training TWSS strings..."
      File.read(File.join(path, 'twss.txt')).each_line do |l|
        engine.train(TWSS::Engine::TRUE, strip_tweet(l))
      end

      puts "Writing to file..."
      engine.dump_classifier_to_file

      puts "Done."
    end

    # A little cleanup of the text before we train on it.
    def strip_tweet(text)
      t = text.gsub(/[\@\#]\w+\b/i, '') # strip mentions and hashtags
      t.gsub!(/(RT|OH)\W/i, '') # strip RT's and OH's
      t.gsub!(/twss/i, '') # strip out twss itself
      t.gsub!(/http:\/\/[A-Za-z0-9\.\/]+/, '') # URLs
      t.gsub!(/[\W\d]/, ' ') # now all non word chars and numbers
      t.strip!
      t
    end

  end

end