bundle check || bundle install
yarn install --check-files
mkdir tmp
mkdir tmp/pids
bundle exec rails db:drop db:create db:migrate db:seed
bundle exec puma -C config/puma.rb
