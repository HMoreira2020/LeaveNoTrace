class SessionsController < ApplicationController 


    get '/login' do 
        if is_logged_in?
            redirect to '/home'
        else 
            erb :'sessions/login'
        end
    end 

    post '/login' do 
      user = User.find_by(trailname: params[:trailname]) 
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect to '/home'
        else 
            flash[:warning] = "Invalid trailname or password"
            redirect to '/login'
        end 
    end 

    get '/logout' do 
        if is_logged_in? 
            session.clear
            redirect to '/'
        else 
            redirect to '/'
        end
    end 

end 