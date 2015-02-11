source 'https://rubygems.org'

ruby '2.1.5'

gem 'rails', '4.1.8'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'stripe'
gem 'bootstrap-sass', '~> 3.2.0'
gem 'autoprefixer-rails'
gem 'devise'
gem 'activeadmin', github: 'activeadmin'
gem 'sdoc', '~> 0.4.0',          group: :doc

group :production do
  gem 'pg'
  gem 'rails_12factor'
end


group :development, :test do
  gem 'sqlite3'
  gem 'spring'
  gem 'rspec-rails', '~> 3.0.0'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'faker'
  gem 'stripe-ruby-mock', '~> 2.0.2', :require => 'stripe_mock'
end

group :development do
	gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_21]
  gem 'annotate'
end

group :test do
	gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
end
