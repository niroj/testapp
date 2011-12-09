class Review < ActiveRecord::Base
  belongs_to :destination
  belongs_to :user

  validates :content, :length => 10..240

  after_save :notify_destination_owner

  private

  def notify_destination_owner

    Notify.notify_owner(self).deliver

  end

  # def sanitize
  #   self.content = clear_up(self.content)
  # end
  #
  # def clear_up(content)
  #
  #
  #
  # end

end
