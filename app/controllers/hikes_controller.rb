class HikesController < ApplicationController 

    get '/hikes' do 
        if is_logged_in?
            current_user 
            @hikes = Hike.all
            erb :'hikes/index'
        else 
            redirect to '/login'
        end
    end 

    get '/hikes/new' do
        if is_logged_in? 
            erb :'hikes/new'
        else 
            redirect '/login'
        end
    end 

    post '/hikes' do 
            @hike = current_user.hikes.build(params)
            @hike.save 
            @hikes = Hike.all
            erb :'hikes/index'
    end 

    get '/hikes/:id' do 
        if is_logged_in? 
            @hike = Hike.find_by_id(params[:id])
            erb :'hikes/show'
        else
            redirect "/login"
        end
    end 

    get '/hikes/:id/edit' do 
        if is_logged_in?
            @hike = Hike.find_by_id(params[:id])
            if @hike.user == current_user 
                erb :'hikes/edit'
            else
                redirect to '/hikes'
            end 
        else
            redirect "/login"
        end 
    end 

    patch '/hikes/:id/edit' do 
        if !params.values.any?{|param| param.empty?}
            @hike = Hike.find_by(params[:id])
            @hike.update(params[:hike])
            redirect to "/hikes/#{@hike.id}"
        else 
            @error = "You must fill in all fields"
            redirect "/hikes/#{@hike.id}/edit"
        end
    end 

    delete '/hikes/:id' do 
        @hike = Hike.find_by(params[:id])
        if @hike.user == current_user 
            @hike.destroy 
            redirect to '/hikes'
        else 
            redirect to "/hikes/#{@hike.id}"
        end
    end 
end 