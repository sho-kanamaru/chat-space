source 'https://rubygems.org'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'mysql2', '0.3.18'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'pry-rails'
gem 'puma', '~> 3.7'
gem 'websocket-rails'

#画像系
gem 'carrierwave'
gem 'fog'
gem 'mini_magick'
#見た目
gem 'jquery-rails'
gem 'font-awesome-rails'
#haml適応
gem 'haml-rails'
#devise系
gem 'devise'

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails'
  gem 'factory_girl_rails', "~> 4.4.1"
  gem 'rails-controller-testing'
  gem 'capistrano'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano3-unicorn'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'erb2haml'
end

group :production do
  gem 'unicorn'
end

group :test do
  gem 'faker'
end

group :production, :staging do
  gem 'rails_12factor'
end

