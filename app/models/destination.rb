class Destination < ActiveRecord::Base

  belongs_to :user
  has_many :reviews

  validates :place, :presence => true, :format => {:with => /^([a-zA-Z]|\s)+$/}
  validates :description, :length => 10..240

end
