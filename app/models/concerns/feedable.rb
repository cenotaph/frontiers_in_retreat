module Feedable
  extend ActiveSupport::Concern
  
  def add_to_feed
    
    Feed.create(:item_id => self.id, :item_type => self.class.to_s, :timestamp => self.feed_time,  :title => self.feed_title, link_url: self.feed_url)
  end
  
  def check_for_feed
    add_to_feed unless self.hide_from_feed == true || self.published != true
  end
  
end