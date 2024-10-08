module RequestsLog
  extend ActiveSupport::Concern

  included do
    before_action :log_request

    private

    def log_request
      ip_address = request.remote_ip
      user = current_user if user_signed_in?

      if user
        request_logger = RequestLogger.find_or_create_by(user: user)
      else
        request_logger = RequestLogger.find_or_create_by(ip_address: ip_address)
      end

      request_logger.increment!(:request_count)
    end
  end
end
