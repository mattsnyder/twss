require File.join(File.dirname(__FILE__), '../lib/twss')
require File.join(File.dirname(__FILE__), '../lib/twss/tweet_collector')

TWSS::TweetCollector.new(':)', File.join(File.dirname(__FILE__), '../data/non_twss.txt')).run
