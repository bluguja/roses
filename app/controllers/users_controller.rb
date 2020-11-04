class UsersController < ApplicationController
get '/users' do 
  @users = User.all
erb :'/users/index'
end


  get '/signup' do
    if !session[:id] #if its false
      erb :'users/signup' 
    end
  end 
    
  post '/signup' do 
# i want my user's request to be processed and sent to /signup 
      @user = User.new(username: params[:username], password: params[:password])
    if @user.save #how you validate if user gives all info 
      session[:user_id] = @user.id 
#session is hash
      flash[:notice] = "Thanks for signing up #{@user.username}!"
      redirect '/home' 
    else 
      redirect '/'   
    end
  end
end