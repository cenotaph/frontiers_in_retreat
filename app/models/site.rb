class Site < ActiveRecord::Base
  geocoded_by :full_street_address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
  extend FriendlyId
  friendly_id :shortname, use: [:slugged, :finders]
  default_scope { order(:id) }
  scope :current, -> { where(current: true)}
  mount_uploader :image, ImageUploader
  before_save :update_image_attributes
  has_many :residencies 
  
  def update_image_attributes
    if image.present?
      self.image_content_type = image.file.content_type
      self.image_size = image.file.size
      self.image_width, self.image_height = `identify -format "%wx%h" #{image.file.path}`.split(/x/)
    end
  end
    
  def full_street_address
    [address, city, country].compact.join(', ')
  end
  
  def shortname
    name.split(/\s\W\s/)[0]
  end
end
