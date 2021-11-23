class UserMailer < ApplicationMailer
  default :from => 'me@example.com'

  def inventory_quantity_zero
    binding.pry
    @user = params[:user]
    mail(
      :to => @user.email,
      :subject => 'Your inventory item quantity has reached zero'
    )
  end
end
