require './config/environment'

class ApplicationController < Sinatra::Base 

    configure do 
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "password_security"
        register Sinatra::Flash
    end 

 

    get '/' do 
        if is_logged_in?
            redirect to '/hikes'
        else
            erb :index
        end
    end 

    
    get '/home' do 
        if !is_logged_in?
            redirect to '/login'
        else
            erb :home
        end
    end 

    helpers do
		def is_logged_in?
			!!current_user
		end

		def current_user
			User.find(session[:user_id]) if session[:user_id]
		end
	end

   
end 
