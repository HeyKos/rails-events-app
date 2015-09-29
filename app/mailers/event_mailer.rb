class EventMailer < ApplicationMailer

  def event_created_email(event)
    @event = event
    mail(to: event.user.email, subject: 'New event created')
  end

end
