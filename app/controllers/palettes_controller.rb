class PalettesController < ApplicationController
    def show
        @palette = Palette.find(params[:id])
        render json: @palette
    end

    def create
        @new_palette = Palette.new(project_id: params[:project_id])
        if @new_palette.save
            render json: @palette
        end
    end

    def delete
        @palette = Palette.find(params[:id])
        @palette.destroy
        render json: {success: "#{@pallette.id} was destroyed."}
    end
end