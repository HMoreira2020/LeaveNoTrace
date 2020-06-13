class UsersController < ApplicationController 

    get '/signup' do 
        if !is_logged_in?
            erb :'users/new'
        else
            redirect to '/hikes'
        end
    end 

    post '/signup' do 
        if params[:trailname].empty? || params[:email].empty? || params[:password].empty?
            # flash[:message] = "All fields are required"
            redirect to '/signup'
        else
            @user = User.create(params)
            session[:user_id] = @user.id 
            redirect to '/login'
        end
    end 

    get '/users/:slug' do 
        @user = User.find_by_slug(params[:slug])
        @hikes = @user.hikes
        erb :'/users/show'
    end 

    get '/users' do 
        if is_logged_in?
            @users = User.all 
            erb :'users/index'
        else 
            redirect to '/login'
        end
    end 
end 