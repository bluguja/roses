class RosesController < ApplicationController

# CREATE
    # New get '/roses/new' = called NEW ACTION, renders new view
     get '/roses/new' do
      redirect_if_not_logged_in 
      erb :'roses/new'
  end                 
    # create
    # make a post request to '/roses'
    post '/roses' do
    redirect_if_not_logged_in
    @rose = current_user.roses.build(rose_name: params["Rose Name"], rose_type: params["Type of Rose"], description: params["Description of Type"], image: params["Image of Flower"])

      if @rose.save
        redirect "/roses/#{@rose.id}"
      else
        redirect '/roses/new'
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
    #if 
      @rose = Rose.find_by_id(params[:id])
    #   if session[:user_id] == @rose.user_id 
         erb :'roses/show'
    #     else 
    #       redirect '/roses' 
    #   end 
    # #else 
    #   redirect '/login'
    #end 
  end  
        
     get '/roses/:id/edit' do
    if logged_in?
      @user = current_user
      @rose = Rose.find_by_id(params[:id])
      erb :'roses/edit'
      if authorized_to_edit?(@rose)
        erb :'roses/edit'
      else
        flash[:error] = "Editing Prohibited !"
        redirect '/roses'
      end
    else
      redirect '/login'
    end
  end


# UPDATE
    # Edit
    # Make a get request to '/roses/:id/edit'
patch '/roses/:id' do
    if logged_in?
      Rose = Rose.find_by_id(params[:id])
      Rose.update(rose_name: params["Rose Name"], rose_type: params["Type of Rose"], description: params["Description of Type"], image: params["Image of Flower"])
      redirect "/roses/#{rose.id}"
    else 
      flash[:error] = "This Data Cannot be Edited! "
      redirect "/"
    end 
  end
    
# Destroy
    #make a delete request to '/roses/:id'
     delete '/roses/:id' do
      redirect_if_not_logged_in
      rose = Book.find_by_id(params[:id])
      if authorized_to_edit?(rose)
        rose.destroy 
        redirect '/roses'
      else
        redirect '/home'
      end
  end    
end



