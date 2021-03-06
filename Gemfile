source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.2'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

# gems I've installed my damn self
gem 'simple_form', '~> 3.4'
gem 'devise', '~> 4.2'
gem 'voltaire', '~> 0.4.5'
gem 'jquery-ui-rails', '~> 6.0', '>= 6.0.1'
gem 'bootstrap-sass', '~> 3.3.7'
gem 'mini_magick'
gem 'carrierwave'
gem 'carrierwave-video-thumbnailer', '~> 0.1.4'
gem 'carrierwave-video', '~> 0.6.0'
gem 'carrierwave-audio', '~> 1.0', '>= 1.0.8'
gem 'carrierwave-ffmpeg', '~> 1.0'
gem 'streamio-ffmpeg', '~> 3.0', '>= 3.0.2'
gem 'jcrop-rails-v2', '~> 0.9.12.3'
gem 'acts-as-taggable-on', '~> 5.0'
gem "strip_attributes"
gem 'acts_as_votable', '~> 0.11.1'
gem 'friendly_id', '~> 5.1.0'
gem 'rmagick', '~> 2.16'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.4'

group :development, :test do
  gem 'sqlite3'
  gem 'byebug', platform: :mri
  gem 'faker', '~> 1.7', '>= 1.7.3'
  gem 'pry', '~> 0.10.3'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
