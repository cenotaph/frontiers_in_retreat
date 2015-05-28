client = Twitter::REST::Client.new do |config|
  config.consumer_key        = Figaro.env.twitter_consumer_key
  config.consumer_secret     = Figaro.env.twitter_secret

end