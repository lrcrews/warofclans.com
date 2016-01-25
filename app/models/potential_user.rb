class PotentialUser < ActiveRecord::Base

  validates_format_of :email, with: /@/
  
end
