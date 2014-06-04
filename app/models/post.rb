class Post < ActiveRecord::Base
  belongs_to :user
  has_many :images, as: :item
  paginates_per 3
  validates_presence_of :title, :body, :user_id
  
  before_save :check_published_at
  
  accepts_nested_attributes_for :images, :reject_if => proc {|x| x['image'].blank? }, :allow_destroy => true
    
  scope :published, -> { where(published: true).order('published_at DESC') }

  def check_published_at
    if self.published == true && self.published_at.blank?
      self.published_at ||= Time.now
    end
  end
  
end
