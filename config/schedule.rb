# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

env :PATH, ENV['PATH']

# Creates a output log for you to view previously run cron jobs
set :output, { error: 'log/cron_error_log.log', standard: 'log/cron_log.log' }

# Sets the environment to run during development mode (Set to production by default)
set :environment, 'development'

every 5.minutes do   
    runner 'User.send_digest' 
end