TWSS
====

Because automation knows no bounds... including lowbrow comedy.

TWSS is a simple Bayes classifer trained off of a Twitter #twss search.

Installation
------------

    gem install twss

Usage
-----

    require 'rubygems'
    require 'twss'
    TWSS("hey, did you resolve that ticket?") # => false
    TWSS("not yet, it's taking a while") # => false
    TWSS("well hurry up, you're not going fast enough") # => true

You can also adjust the scoring threshold for your comedic customization.  The
lower the value, the more "obscure" the jokes can be.

    TWSS.treshold = 2.0

It's far from perfect, but it's accurate enough to be funny.  I'll probably
continue tweaking it some (increase the training set size and whatnot).  I'm not
being all that scientific about, so we'll see :).

Goals
-----

There aren't any, other than to laugh.

I made [twssbot][twssbot] which is a TWSS IRC bot that using twss and [isaac][isaac]

I'd love to see some other random applications of twss, but not a twitter bot.
For the love of all things good in this world, please don't make a Twitter
bot out of this. #ihatetwitterbots

Forks, patches, and tests welcome!

Have fun!

[twssbot]: http://github.com/bvandenbos/twssbot
[isaac]: http://github.com/ichverstehe/isaac