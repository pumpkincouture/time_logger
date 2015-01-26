source 'https://rubygems.org'

gem 'sinatra', '1.4.5'
gem 'data_mapper', '1.2.0'

# group :development, :test do
#   gem 'sqlite3', '~> 1.3.10'
#   gem 'rspec', '3.0.0'
# end
# group :production do
#   gem 'pg'
# end
group :production do
    gem "pg"
    gem "dm-postgres-adapter"
end

group :development, :test do
    gem 'sqlite3', '~> 1.3.10'
    gem "dm-sqlite-adapter"
end

# gem 'dm-postgres-adapter', :group => :production
# gem 'dm-sqlite-adapter', :group => :development

