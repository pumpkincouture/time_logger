source 'https://rubygems.org'

gem 'data_mapper', '1.2.0'
gem 'model_citizen', '~> 0.0.5'
ruby '2.2.0'


group :production do
    gem "dm-postgres-adapter"
    gem "pg"
end

group :development, :test do
    gem 'sqlite3', '~> 1.3.10'
    gem "dm-sqlite-adapter"
    gem 'rspec', '3.1.0'
end

