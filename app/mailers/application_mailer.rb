class ApplicationMailer < ActionMailer::Base
  default from: ENV["smtp_user_name"]
  layout 'mailer'
end
