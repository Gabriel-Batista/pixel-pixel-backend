class ColorsController < ApplicationController
    def create
        @new_color = Color.new(rgb: params[:rgb], hex: params[:hex])
        render json: @color
    end

    def update
        @color = Color.find(parmas[:id])
        @color.update(rgb: params[:rgb], hex: params[:hex])
        render json: @color
    end

    def delete
        @color = Color.find(parmas[:id])
        @color.destroy
    end
end