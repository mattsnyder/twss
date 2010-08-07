require 'twitter'

module TWSS

  class TweetCollector

    attr_reader :search, :filename, :limit

    def initialize(search, filename, limit = 1500)
      @search, @filename, @limit = search, filename, limit
    end

    def run
      o = File.open(filename, 'a')
      page, per_page = 1, 100
      begin
        Twitter::Search.new(search).per_page(per_page).page(page).each do |tweet|
          puts tweet.text
          o.puts tweet.text
        end
        page += 1
        sleep 2
      end while page * per_page < limit
      o.close
    end

  end

end
