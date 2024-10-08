class ApplicationController < ActionController::Base
  include ErrorHandling
  include Pagy::Backend
  include Internationalization
  include Authorization
  include RequestsLog
end
