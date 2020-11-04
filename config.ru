require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# this requires any images and css that are stored in the /public directory
use Rack::Static, :root => 'public', :urls => ['/images', '/stylesheets']
use UsersController 
use SessionsController
use RosesController # mount the controller so we can rene on web
run ApplicationController
