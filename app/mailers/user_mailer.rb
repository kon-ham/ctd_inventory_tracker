class UserMailer < ApplicationMailer
  default :from => ENV["smtp_user_name"]

  def inventory_quantity_zero
    @user = params[:user]
    mail(to: @user.email, subject: 'Your inventory item quantity has reached zero.')
  end
end
