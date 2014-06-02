class Site < ActiveRecord::Base
  geocoded_by :full_street_address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
   
  scope :current, -> { where(current: true)}
  
  def full_street_address
    [address, city, country].compact.join(', ')
  end
  
end
