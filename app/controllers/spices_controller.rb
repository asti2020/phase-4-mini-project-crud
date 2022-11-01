class SpicesController < ApplicationController

   def index
        spi = Spice.all
        render json: spi
   end

    # def show
    #     species = Spice.find(params[:id])
    #     render json: species
    # end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update
        spice = Spice.find(params[:id])
        spice.update(spice_params)
        render json: spice
    end

    def destroy
        spice = Spice.find(params[:id])
        spice.destroy
        head :no_content
    end

    private
        def spice_params
            params.permit(:name, :image, :description, :notes, :rating)
        end

        def single_spice
            Spice.find_by(id: params[:id])
        end
end
