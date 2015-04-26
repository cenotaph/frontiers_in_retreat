class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  validates_presence_of :title, :body
  scope :published, -> { where(published: true)}
end
