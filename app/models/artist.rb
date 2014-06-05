class Artist < ActiveRecord::Base

  def name
    [firstname, surname].join(' ')
  end
end
