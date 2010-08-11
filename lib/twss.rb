require 'rubygems'
require 'forwardable'

require File.join(File.dirname(__FILE__), 'twss/engine')

module TWSS

  Version = '0.0.2'

  class << self

    extend Forwardable

    def_delegators :engine, :threshold, :threshold=

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