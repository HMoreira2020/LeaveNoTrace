class UsersController < ApplicationController 

    get '/signup' do 
        if !is_logged_in?
            erb :'users/new'
        else
            redirect to '/hikes'
        end
    end 

    post '/signup' do 
        @user = User.new(params)
        if @user.save
            session[:user_id] = @user.id 
            redirect to '/home'
        else 
            erb :'users/new'
        end 
    end 

    get '/users/:slug' do
        @user = User.find_by_slug(params[:slug])
        @hikes = @user.hikes
        erb :'/users/show'
    end 

    get '/users' do 
        redirect_if_not_logged_in 
        @users = User.all 
        erb :'users/index'
    end 
end 