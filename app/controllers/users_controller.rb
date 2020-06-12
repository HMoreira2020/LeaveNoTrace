class UsersController < ApplicationController 

    get '/signup' do 
        erb :'users/new_user'
    end 

    post '/signup' do 
        if params[:trailname].empty? || params[:email].empty? || params[:password].empty?
            flash[:message] = "All fields are required"
            redirect to '/signup'
        else
            @user = User.create(params)
            session[:user_id] = @user.id 
            redirect to '/login'
        end
    end 
end 