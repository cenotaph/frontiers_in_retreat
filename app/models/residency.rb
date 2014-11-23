class Residency < ActiveRecord::Base
  belongs_to :artist
  belongs_to :site
  validates_presence_of :start_at, :end_at, :artist_id, :site_id
  
end
