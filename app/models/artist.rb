class Artist < ActiveRecord::Base

  scope :visible, -> { where(visible: true)}
  
  def name
    [firstname, surname].join(' ')
  end
end
