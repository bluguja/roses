class SessionsController < ApplicationController

  get '/login' do
    #  if logged_in?
    if !session[:user_id].nil?
      redirect '/roses'
    else 
      erb :'sessions/login'
    end
  end 
    #prevent login form from showing if user is already logged in
    #render my login form to user 
    
    post '/login' do
    #receive data (params) from the login form
    @user = User.find_by(username: params[:username].strip)
    
    #find the user with value of params
    if @user && @user.authenticate(params[:password])
      #authenticate the user
      session[:user_id] = @user.id 
      
      #create key/value pair in session using users id to actually log them in
      flash[:notice] = "Welcome back #{@user.username} !"
      
      #add success message to flash hash
      redirect '/roses'
    else
      #show error message
      #this is where my error message will display (at the login route)
      flash[:error] = "Invalid Username or Password. Please try again!" 
      
      #redirecting back to login page
      redirect '/login'
      
      end 
    end
    
  get '/logout' do 
  
      session.clear
      flash[:notice] = "Success at log out!"
      redirect '/'
  
  end 
end