class ApplicationMailer < ActionMailer::Base
  default from: ENV["PROJECT_EMAIL"]
  layout "mailer"
end
