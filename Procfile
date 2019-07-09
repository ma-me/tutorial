release: bundle exec rake db:migrate
web: bin/start-nginx bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq -q default -q mailers
