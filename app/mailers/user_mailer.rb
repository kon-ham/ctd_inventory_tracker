class UserMailer < ApplicationMailer
  default :from => 'me@example.com'

  def send_signup_email(user)
    @user = current_user
    mail(
      :to => @user.email,
      :subject => 'Your inventory item quantity has reached zero'
    )
  end
end
