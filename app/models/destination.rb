class Destination < ActiveRecord::Base  
                     
  belongs_to :user
  has_many :reviews
  
  validates :place, :presence => true
  validates :description, :length => 10..240
  
end
