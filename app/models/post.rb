class Post < ActiveRecord::Base
  belongs_to :user
  has_many :images, as: :item
  paginates_per 3
  validates_presence_of :title, :body, :user_id
  include Feedable
  before_save :check_published_at
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  attr_accessor :hide_from_feed
  has_one :feed, as: :item
  accepts_nested_attributes_for :images, :reject_if => proc {|x| x['image'].blank? }, :allow_destroy => true
    
  scope :published, -> () { where(published: true).order('published_at DESC') }
  scope :news, -> () { where(blog: false)}
  scope :blog, -> () { where(blog: true) }
  
  def author_name
    if user.artist
      user.artist.name
    else
      user.username
    end
  end
  
  def check_published_at
    if self.published == true && self.published_at.blank?
      self.published_at ||= Time.now
      self.check_for_feed
    end
  end
  
  def feed_title
    title
  end
  
  def feed_time
    published_at
  end
  
  def feed_url
    "/posts/#{slug}"
  end
  
end
