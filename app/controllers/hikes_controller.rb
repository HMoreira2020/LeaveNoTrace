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
        binding.pry 
        erb :'hikes/new'
    end 

    post '/hikes' do 
        @hike = current_user.hikes.build(params)
        @hike.save 
        @hikes = Hike.all
        erb :'hikes/index'
    end 

    get '/hikes/:id' do 
        @hike = Hike.find_by_id(params[:id])
        erb :'hikes/show'
    end 

    get '/hikes/:id/edit' do 
        @hike = Hike.find_by_id(params[:id])
        erb :'hikes/edit'
    end 

    patch '/hikes/:id/edit' do 
        if !params.values.any?{|param| param.empty?}
            @hike = Hike.find_by(params[:id])
            @hike.update(params[:hike])
            redirect to "/hikes/#{@hike.id}"
        else 
            redirect "/hikes/#{@hike.id}/edit"
        end
    end 

    delete '/hikes/:id' do 
        binding.pry
        @hike = Hike.find_by(params[:id])
        if @hike.user == current_user 
            @hike.destroy 
            redirect to '/hikes'
        else 
            redirect to "/hikes/#{@hike.id}"
        end
    end 
end 