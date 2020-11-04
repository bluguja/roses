require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride #for put/patch capabilities
Dir[File.join(File.dirname(__FILE__), "app/controllers", "*.rb")].collect {|file| File.basename(file).split(".")[0] }.reject {|file| file == "application_controller" }.each do |file|
  string_class_name = file.split('_').collect { |w| w.capitalize }.join
  class_name = Object.const_get(string_class_name)
  use class_name
end 




# this requires any images and css that are stored in the /public directory
use Rack::Static, :root => 'public', :urls => ['/images', '/stylesheets']
use UsersController 
use SessionsController
use RosesController # mount the controller so we can rene on web
run ApplicationController
