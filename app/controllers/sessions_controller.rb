class SessionsController < ApplicationController 


    get '/login' do 
        erb :'sessions/login'
    end 

    post '/login' do 
    #   raise params.inspect
      @user = User.find_by(params[:trailname]) 
        if @user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect to '/hikes'
        else 
            #flash[:message] = "Invalid Login Info"
            redirect to '/login'
        end 
    end 

    get '/logout' do 
    end 

    post '/logout' do 
    end 

end 