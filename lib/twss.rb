require 'rubygems'
require 'forwardable'

require File.join(File.dirname(__FILE__), 'twss/engine')

class TWSS

  Version = '0.0.1'

  class << self

    def classify(str)
      engine.classify(str)
    end

    def engine
      @engine ||= TWSS::Engine.new
    end

  end

end

# Shortcut for TWSS.classify(str)
def TWSS(str)
  TWSS.classify(str)
end