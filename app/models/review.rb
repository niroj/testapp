class Review < ActiveRecord::Base
  belongs_to :destination
  belongs_to :user   
  
  validates :content, :length => 10..240
end
