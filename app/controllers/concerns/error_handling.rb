module ErrorHandling
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_resource
    rescue_from ActionController::RoutingError, with: :not_found_route

    def not_found_route
      render file: 'public/404.html', status: :not_found, layout: false
    end

    private

    def not_found_resource(exception)
      logger.warn exception
      render file: 'public/404.html', status: :not_found, layout: false
    end
  end
end
