class HikesController < ApplicationController 

    get '/hikes' do 
        # if is_logged_in?
            @hikes = Hike.all
            erb :'hikes/index'
        # else 
        #     redirect to '/login'
        # end
    end 

    get '/hikes/new' do 
        erb :'hikes/new'
    end 

    post '/hikes' do 
        @hike = current_user.hikes.build(params)
        @hike.save 
        @hikes = Hike.all
        erb :'hikes/index'
    end 

    get '/hike/:id' do 
        binding.pry
        @hike = Hike.find_by(params[:id])
    end 

    get '/hikes/:id/edit' do 
        @hike = Hike.find_by(params[:id])

    end 

    patch '/hikes/:id/edit' do 
        @hike = Hike.find_by(params[:id])
    end 

    delete '/hikes/:id' do 
        @hike = Hike.find_by(params[:id])
    end 
end 