require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    # set :public_folder, 'public'
    # set :views, 'app/views'
    # enable :sessions
register Sinatra::ActiveRecordExtension
  enable :sessions
  set :session_secret, "password_security"
  set :views, Proc.new { File.join(root, "../views/") } 
  
    register Sinatra::Flash
    
  end

  get "/" do
    erb :welcome
    #binding.pry
  end


get '/home' do 
    # if logged_in?
    if !session[:user_id].nil?
      @roses = current_user.roses
        erb :welcome
      else
        flash[:notice] = "Welcome!"
        redirect to "/"
      end       
  end
end
