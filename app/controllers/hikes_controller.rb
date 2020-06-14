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
        if @hike.save 
            @hikes = Hike.all
            erb :'hikes/index'
        else 
            erb :'hikes/new'
        end
    end 

    get '/hikes/:id' do 
        if is_logged_in? 
            @hike = Hike.find_by(params[:id])
            erb :'hikes/show'
        else
            redirect "/login"
        end
    end 

    get '/hikes/:id/edit' do 
        if is_logged_in?
            @hike = Hike.find_by(params[:id])
            if @hike.user == current_user 
                erb :'hikes/edit'
            else
                flash[:warning] = "You are Not Authorized to Edit this Hike"
                redirect to "/hikes/#{@hike.id}"
            end 
        else
            redirect "/login"
        end 
    end 

    patch '/hikes/:id/edit' do 
        @hike = Hike.find_by(params[:id])
        if !params[:hike].values.any?{|param| param.empty?}
            if @hike.user == current_user 
                @hike.update(params[:hike])
                redirect to "/hikes/#{@hike.id}"
            else 
                flash[:warning] = "You are Not Authorized to Edit this Hike"
                redirect to "/hikes/#{@hike.id}"
            end
        else 
            flash[:message] = "All fields are required"
            redirect "/hikes/#{@hike.id}/edit"
        end
    end 

    delete '/hikes/:id' do 
        @hike = Hike.find_by(params[:id])
        if @hike.user == current_user 
            @hike.destroy 
            flash[:notice] = "Hike Successfully Deleted"
            redirect to '/hikes'
        else 
            flash[:warning] = "You are Not Authorized to Delete this Hike"
            redirect to "/hikes/#{@hike.id}"
        end
    end 
end 