class Event < ActiveRecord::Base
  belongs_to :site
  validates_presence_of :start_at, :name
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  has_and_belongs_to_many :residencies
  accepts_nested_attributes_for :residencies
  
  mount_uploader :image, ImageUploader
  before_save :update_image_attributes

  scope :published, -> { where(published: true) }
  
  private
  
  def should_generate_new_friendly_id?
    changed?
  end
  
  
  def update_image_attributes
    if image.present?
      if image.file.present?
        self.image_content_type = image.file.content_type
        self.image_size = image.file.size
        self.image_width, self.image_height = `identify -format "%wx%h" #{image.file.path}`.split(/x/)
      end
    end
  end
  
end
