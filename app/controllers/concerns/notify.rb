module Notify
  extend ActiveSupport::Concern

  included do

    private

    def notify_user(user)
      NotificationsMailer.with(user: user).send_notification.deliver_later
    end

    def notify_admin
      @admin = User.find_by(email: ENV["ADMIN_EMAIL"])

      if @admin.present?
        NotificationsMailer.with(user: @admin).send_notification.deliver_later
      end
    end
  end
end
