class Artist < ActiveRecord::Base

  scope :visible, -> { where(visible: true)}
  
  def name
    [firstname, surname].join(' ')
  end

  def sortkey
    sortname.blank? ? surname.strip : sortname.strip
  end
  
end

