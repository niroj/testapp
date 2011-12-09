module MailerHelper

  def last_email
    ActionMailer::Base.deliveries.last
  end

  def reset_email

    ActionMailer::Base.deliveries = []

  end

end

Rspec.configure do |config|
    config.include MailerHelper
    config.before(:each) { reset_email }
  end