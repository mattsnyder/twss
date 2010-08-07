require 'classifier'

module TWSS

  class Engine

    extend Forwardable

    def_delegators :@classifier, :train, :untrain, :classifications

    DATA_FILE = File.join(File.dirname(__FILE__), '../../data/classifier')

    TRUE = '1'
    FALSE = '0'

    attr_accessor :threshold
    
    def initialize(options = {})
      @data_file = options[:data_file] || DATA_FILE
      @threshold ||= options[:threshold] || 5.0
      @classifier = load_classifier_from_file!(@data_file) || new_classifier
    end

    def classify(str)
      if basic_conditions_met?(str)
        c = @classifier.classifications(str)
        # We want to be a little stricter about matches, so
        # compare the differences against a threshold rather than just taking
        # the lowest score.
        puts c[TRUE] - c[FALSE]
        c[TRUE] - c[FALSE] > threshold
      else
        false
      end
    end

    # Dumps the current classifier state to specified path
    def dump_classifier_to_file(f = @data_file)
      o = File.open(f, 'w')
      o.write(Marshal.dump(@classifier))
      o.close
    end

    # Clears out the current classifier instance and nukes the data file
    def clear_state!
      File.delete(@data_file) if File.exists?(@data_file)
      @classifier = new_classifier
    end

    private

    def new_classifier
      Classifier::Bayes.new(TRUE, FALSE)
    end

    def basic_conditions_met?(str)
      str.split(' ').length > 3 # more than 3 words
    end

    # Given a path to a classifier file, load the instance into memory
    def load_classifier_from_file!(f)
      Marshal.load(File.read(f)) rescue nil if File.exists?(f)
    end

  end

end