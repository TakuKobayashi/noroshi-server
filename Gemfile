source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.6'

gem 'mysql2'

# Use SCSS for stylesheets
gem 'sass-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

gem 'addressable'

gem 'jpmobile'

gem 'useragent'

#マルチプラットフォームに対応したOauth認証用
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-facebook'

#認証後twitterにtweetするためのもの
gem 'twitter'

#クーロン作成
gem 'whenever', :require => false

#管理ツール作成-> active_admin用
gem 'devise'
gem 'activeadmin', github: 'activeadmin'

#push通知など外部APIを使うときは非同期に処理にしてしまいたい
gem "delayed_job"
gem "delayed_job_active_record"

# デプロイ先でデーモンとして動かすのに必要
gem "daemons"

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.7'

# Use unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :test do
  gem 'spork'
  gem 'guard-spork'
end

group :development, :test do
  gem 'rspec'
  gem 'rspec-rails'
  gem 'guard'
  gem 'guard-rspec'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
end

#modelにDBのカラム名とかを表記
gem 'annotate'
#ページネート
gem 'kaminari'
#一括insert作成用
gem 'activerecord-import'
gem 'execjs'
#push通知用
gem 'gcm'
