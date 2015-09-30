web: bundle exec unicorn_rails -p $PORT -c ./config/unicorn.rb
worker: env TERM_CHILD=1 QUEUE=* bundle exec rake environment resque:work
