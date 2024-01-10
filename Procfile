web: bundle exec puma -C config/puma.rb
js: yarn build
css: yarn build:css
release: bundle exec rails db:migrate
worker: bundle exec sidekiq -c 5 -v -q default -q mailers