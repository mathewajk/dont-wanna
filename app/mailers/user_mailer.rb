class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.has_todos.subject
  #
  default from: "dontwanna@fyridis.net"
  
  def has_todos(user)
    @user = user
    Rails.logger.info("Sending email to #{@user.email_address}")
    mail to: @user.email_address, subject: "Don't want to do anything?"
  end

  def registration_confirmation
    @user = params[:user]
    mail to: @user.email_address, subject: "Welcome to Don't Wanna!"
  end
end
