namespace :hiap do
  
  desc 'get latest tweets'
  task :check_twitter => :environment do
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Figaro.env.twitter_consumer_key
      config.consumer_secret     = Figaro.env.twitter_secret
    end
    
    # first check the @HIAP_FI twitter 
    client.user_timeline("HIAP_FI").each do |tweet|
      next if Feed.find_by(twitter_id: tweet.id)
      Feed.create(twitter_id: tweet.id, timestamp: tweet.created_at, content: tweet.text, title: "@HIAP_FI",
      link_url: tweet.url.to_s, source: "twitter", hidden: false)
    end
    client.search("#FrontiersInRetreat").each do |tweet|
      next if Feed.find_by(twitter_id: tweet.id)
      Feed.create(twitter_id: tweet.id, timestamp: tweet.created_at, content: tweet.text, title: "@#{tweet.user.screen_name}",
      link_url: tweet.url.to_s, source: "twitter", hidden: false)
    end
      
  end

end
