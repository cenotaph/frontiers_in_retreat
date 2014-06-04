class Post < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :body, :user_id
  
  before_save :check_published_at
  
  scope :published, -> { where(published: true).order('published_at DESC') }

  def check_published_at
    if published == true && published_at.blank?
      published_at ||= Time.now
    end
  end
  
end
