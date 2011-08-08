# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
gem 'rake', '0.8.7'
require 'rake','0.8.7'

class Rails::Application
  
  include Rake::DSL if defined?(Rake::DSL)
  
    
end

DailyQueue::Application.load_tasks
