class OrderMailerPreview < ActionMailer::Preview
  def inventory_quantity_zero
    @user = params[:user]
    mail to: @user.email, subject: 'Your inventory item quantity has reached zero.'
  end
end