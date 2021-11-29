class ApplicationMailer < ActionMailer::Base
  default from: ENV["mailgun_user_name"]
  layout 'mailer'
end
