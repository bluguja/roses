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
  
    @rose = Rose.create(rose_name: params[:rose_name], rose_type: params[:rose_type], description: params[:description], image: params[:image], user_id: session[:user_id])
  
      if @rose.nil?
        redirect "/roses/new"
      else
        redirect "/roses/#{@rose.id}"
      end 
  end
# READ
    # Index
     get '/roses' do #index route 
    # if logged_in?
    @user = User.find_by_id(session[:user_id])
    @roses = Rose.all
      if !session[:user_id].nil?
      #@user = current_user
      erb :'roses/index'
    else 
      redirect '/'
    end 
  end
    # make a get request to '/roses'
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
     
    # if 
    #   @user = current_user
    #   @rose = Rose.find_by_id(params[:id])
    #   erb :'roses/edit'
    #   if authorized_to_edit?(@rose)
    #     erb :'roses/edit'
    #   else
    #     flash[:error] = "Editing Prohibited !"
    #     redirect '/roses'
    #   end
    # else
    #   redirect '/login'
    # end
  end


# UPDATE
    # Edit
    # Make a get request to '/roses/:id/edit'
patch '/roses/:id' do
    @user = User.find_by_id(session[:user_id])
    @rose = Rose.find_by_id(params[:id])

     @rose.update(rose_name: params[:rose_name], rose_type: params[:rose_type], description: params[:description], image: params[:image])
    redirect "/roses/#{@rose.id}"
    # if logged_in?
    #   @rose = Rose.find_by_id(params[:id])
    #   Rose.update(rose_name: params["Rose Name"], rose_type: params["Type of Rose"], description: params["Description of Type"], image: params["Image of Flower"])
    #   redirect "/roses/#{rose.id}"
     #else 
    #   flash[:error] = "This Data Cannot be Edited! "
    #   redirect "/"
    # end 
  end
    
# Destroy
    #make a delete request to '/roses/:id'
     delete '/roses/:id' do

      @rose = Rose.find_by_id(params[:id])
      @rose.delete
      redirect '/roses'
      # redirect_if_not_logged_in
      # @rose = Rose.find_by_id(params[:id])
      # if authorized_to_edit?(rose)
      #   @rose.delete 
      #   redirect '/roses'
      # else
      #   redirect '/home'
      # end
     end
end



