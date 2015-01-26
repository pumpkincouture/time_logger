source 'https://rubygems.org'

gem 'sinatra', '1.4.5'
gem 'data_mapper', '1.2.0'
ruby '2.2.0'

group :production do
    gem "dm-postgres-adapter"
    gem "pg"
end

group :development, :test do
    gem 'sqlite3', '~> 1.3.10'
    gem "dm-sqlite-adapter"
end


