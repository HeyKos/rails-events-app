class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@event-planner.com"
  layout 'mailer'
end
