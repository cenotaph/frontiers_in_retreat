class Site < ActiveRecord::Base
  geocoded_by :full_street_address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
  extend FriendlyId
  friendly_id :shortname, use: [:slugged, :finders]
  default_scope { order(:id) }
  scope :current, -> { where(current: true)}
  
  def full_street_address
    [address, city, country].compact.join(', ')
  end
  
  def shortname
    name.split(/\s\W\s/)[0]
  end
end
