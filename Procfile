web: bundle exec puma -C config/puma.rb
js: yarn build
css: yarn build:css
css2: bin/rails tailwindcss
release: bundle exec rails db:migrate
worker: bundle exec sidekiq -c 5 -v -q default -q mailers