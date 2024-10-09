class NotificationsMailer < ApplicationMailer
  include Rails.application.routes.url_helpers

  def send_notification
    @user = params[:user]

    mail to: @user.email, subject: "You got reply | #{ENV["APP_NAME"]}", from: 'admin@admin.com'
  end
end
