class UsersController < ApplicationController 

    get '/signup' do 
        erb :'users/new'
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
        @user = User.find_by(username: params[:slug])
        @hikes = @user.hikes
        erb :'/users/show'
    end 

    get '/users' do 
        @users = User.all 
        erb :'users/index'
    end 
end 