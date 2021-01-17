class SightingsController < ApplicationController

    #how to render related models as nested JSON data within a single controller action: 
    def index
        sightings = Sighting.all
        render json: sightings, include: [:bird, :location]
    end

      
    def show
        sighting = Sighting.find_by(id: params[:id])
        if sighting
            render json: sighting.to_json(include: [:bird, :location])
        else
            render json: { message: 'No sighting found with that id' }
        end
    end
      

      
end
