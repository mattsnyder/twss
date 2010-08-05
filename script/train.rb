
require File.join(File.dirname(__FILE__), '../lib/twss')
require File.join(File.dirname(__FILE__), '../lib/twss/trainer')

engine = TWSS::Engine.new
trainer = TWSS::Trainer.new(engine)
trainer.train
