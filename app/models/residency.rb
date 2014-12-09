class Residency < ActiveRecord::Base
  belongs_to :artist
  belongs_to :site
  validates_presence_of :start_at, :end_at, :artist_id, :site_id
  has_and_belongs_to_many :residencies
  has_and_belongs_to_many :events
  
  def name
    "#{artist.name} / #{site.name} / #{ApplicationController.helpers.date_range(start_at, end_at)}"
  end
  
end
