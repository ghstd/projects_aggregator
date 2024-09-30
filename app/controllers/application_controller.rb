class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Internationalization
end
