require File.join(File.dirname(__FILE__), '../lib/twss')
require File.join(File.dirname(__FILE__), '../lib/twss/tweet_collector')

TWSS::TweetCollector.new('#twss', File.join(File.dirname(__FILE__), '../data/twss.txt')).run
