class HikesController < ApplicationController 

    get '/hikes' do 
        "You are logged in as #{session[:email]}"
        erb :'hikes/index'
    end 


end 