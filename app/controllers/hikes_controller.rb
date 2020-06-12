class HikesController < ApplicationController 

    get '/hikes' do 
        erb :'hikes/hike_index'
    end 
end 