class Image < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  before_save :update_image_attributes
  belongs_to :item, polymorphic: true
  
  def update_image_attributes
    if image.present?
      self.image_content_type = image.file.content_type
      self.image_size = image.file.size
      self.image_width, self.image_height = `identify -format "%wx%h" #{image.file.path}`.split(/x/)
    end
  end
  
  def caption_and_credit
    [caption.blank? ? nil : caption.upcase, credit.blank? ? nil : "Photo: #{credit}"].compact.join(' / ')
  end
  
end
