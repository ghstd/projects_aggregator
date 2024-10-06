class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Internationalization
  include Authorization
end
