class Artist < ActiveRecord::Base

  scope :visible, -> { where(visible: true)}
  
  def name
    [firstname.blank? ? nil : firstname, surname].compact.join(' ')
  end

  def sortkey
    sortname.blank? ? surname.strip : sortname.strip
  end
  
end

