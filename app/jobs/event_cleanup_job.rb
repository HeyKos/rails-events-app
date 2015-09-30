class EventCleanupJob < ActiveJob::Base
  queue_as :default

  def perform()
    Event.where('user_id IS NULL OR occurs_on < ?', Date.today).each do |e|
      # delete any registrations to the event
      e.registrations.each do |r|
        r.destroy
      end
      # delete the event
      e.destroy
    end
  end
end
