class Destination < ActiveRecord::Base

  belongs_to :user
  has_many :reviews
 # attr_accessible :title ,:description ,:photo
 attr_accessor   :destination_x , :destination_y , :destination_w , :destination_h



  mount_uploader :photo, PhotoUploader

end
