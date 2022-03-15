class BirdsController < ApplicationController

    def index
        birds = Bird.all
        render json: birds
    end
    
    def show
        bird = Bird.find_by(params[:id])
        if bird
            render json: bird
        else
            render json: { error: "Bird not found" }, status: :not_found
        end
    end

    def destroy
        abird = Bird.all.find(params[:id]) 
        abird.destroy
        render json: { message: "goodbye birdie" } 
    end

    def create
        newbird = Bird.create(name: params[:name], species: params[:species])
        render json: { message: "welcome birdie" }
    end

end
