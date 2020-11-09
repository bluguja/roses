class RosesController < ApplicationController

    # CREATE
    # New get '/roses/new' = called NEW ACTION, renders new view
     get '/roses/new' do
     # redirect_if_not_logged_in 
      erb :'roses/new'
     end                 
    # create
    # make a post request to '/roses'
    post '/roses' do
  
    @rose = Rose.create(rose_name: params[:rose_name], rose_type: params[:rose_type], description: params[:description], user_id: session[:user_id])
  
      if @rose.nil?
        redirect "/roses/new"
      else
        redirect "/roses/#{@rose.id}"
      end 
    end
    # READ
    
    get '/roses' do #index route 
    # if logged_in?
    @user = User.find_by_id(session[:user_id])
    @roses = Rose.all
        if !session[:user_id].nil?
        
        erb :'roses/index'
      else 
        redirect '/'
      end 
    end
    
    #make a get request to '/roses/:id'
    get '/roses/:id' do  
      @rose = Rose.find_by_id(params[:id])
      if (@rose.nil?)
        redirect "/roses"    
      else
        erb :'/roses/show'
      end
    
    end  
        
     get '/roses/:id/edit' do
      @rose = Rose.find_by_id(params[:id])
      erb :'/roses/edit'
     
     end


    # UPDATE
    # Make a get request to '/roses/:id/edit'
    patch '/roses/:id' do
    @user = User.find_by_id(session[:user_id])
    @rose = Rose.find_by_id(params[:id])

    @rose.update(rose_name: params[:rose_name], rose_type: params[:rose_type], description: params[:description], )
    redirect "/roses/#{@rose.id}"
    
    end
    
    # Destroy
    #make a delete request to '/roses/:id'
     delete '/roses/:id' do

      @rose = Rose.find_by_id(params[:id])
      @rose.delete
      redirect '/roses'
     
     end
end



