class Artist < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  validates_presence_of :surname
  scope :visible, -> { where(visible: true)}
  
  
  def name
    [firstname.blank? ? nil : firstname, surname].compact.join(' ')
  end

  def sortkey
    sortname.blank? ? surname.strip : sortname.strip
  end
  
end

