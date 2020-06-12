class HikesController < ApplicationController 

    get '/hikes' do 
        erb :'hikes/hike_index'
    end 

    get '/hikes/new' do 
    end 

    post '/hikes' do 
    end 

    get '/hike/:id' do 
    end 

    get '/hikes/:id/edit' do 
    end 

    patch '/hikes/:id/edit' do 
    end 

    delete '/hikes/:id' do 
    end 
end 