bundle check || bundle install
bundle exec rails db:drop db:create db:migrate db:seed
bundle exec puma -C config/puma.rb
