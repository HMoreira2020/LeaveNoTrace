class SessionsController < ApplicationController 


    get '/login' do 
        erb :'sessions/login'
    end 

    post '/login' do 
      raise params.inspet
    end 

end 