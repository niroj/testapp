class Destination < ActiveRecord::Base  
                     
  belongs_to :user
  
  validates :place, :presence => true
  validates :description, :length => 10..240
  
end
