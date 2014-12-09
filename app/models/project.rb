class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  has_and_belongs_to_many :residencies
  accepts_nested_attributes_for :residencies
  has_many :images, as: :item
  accepts_nested_attributes_for :images, :reject_if => proc {|x| x['image'].blank? }, :allow_destroy => true
  validates_presence_of :name
  
  def artists
    residencies.collect(&:artist).uniq.collect(&:name).join(', ')  
  end
end
