class HikesController < ApplicationController 

    get '/hikes' do 
        redirect_if_not_logged_in 
        @hikes = Hike.all.includes(:user)
        erb :'hikes/index'
    end 

    get '/hikes/new' do
        redirect_if_not_logged_in 
        erb :'hikes/new'
    end 

    post '/hikes' do 
        hike = current_user.hikes.build(params)
        if hike.save 
            redirect '/hikes'
        else 
            flash[:message] = "All fields required"
            redirect '/hikes/new'
        end
    end 

    get '/hikes/:id' do 
        redirect_if_not_logged_in 
        @hike = Hike.find_by_id(params[:id])
        erb :'hikes/show'
        
    end 

    get '/hikes/:id/edit' do 
        redirect_if_not_logged_in 
        @hike = Hike.find_by_id(params[:id])
        redirect_if_not_hike_owner(@hike)
        erb :'hikes/edit' 
    end 

    patch '/hikes/:id/edit' do 
        hike = current_user.hikes.find_by(params[:id])
        redirect_if_not_hike_owner(hike)
        if !params[:hike].values.any?{|param| param.empty?}
            hike.update(params[:hike])
            redirect to "/hikes/#{hike.id}"
        else 
            flash[:message] = "All fields are required"
            redirect "/hikes/#{hike.id}/edit"
        end
    end 

    delete '/hikes/:id' do 
        @hike = Hike.find_by_id(params[:id])
        redirect_if_not_hike_owner(@hike) 
        @hike.destroy 
        flash[:notice] = "Hike Successfully Deleted"
        redirect to '/hikes'
    end 

    private
    def redirect_if_not_hike_owner(hike) 
        if hike.user != current_user
            flash[:warning] = "You are Not Authorized to Edit or Delete this Hike"
            redirect to "/hikes/#{hike.id}"
        end
    end 
end 