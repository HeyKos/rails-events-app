require 'resque/tasks'
require 'resque/scheduler/tasks'
require 'active_scheduler'

namespace :resque do
  task :setup do
    require 'resque'
    require 'resque-scheduler'

    Resque.redis = ENV["REDISCLOUD_URL"]

    yaml_schedule = YAML.load_file("#{Rails.root}/config/resque_schedule.yml")
    Resque.schedule = ActiveScheduler::ResqueWrapper.wrap yaml_schedule
  end
end
