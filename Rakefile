task :run do
  system 'ruby ./time_logger.rb'
end

task :server do
  system 'heroku run --app time-logger irb'
end

task :default => :run
