class ColorsController < ApplicationController
    def create
        @new_color = Color.new(rgb: params[:rgb], hex: params[:hex])
        render json: @color
    end

    def edit
        @color = Color.find(parmas[:id])
        if params[:password] == @color.user.password
            @color.update(rgb: params[:rgb], hex: params[:hex])
            render json: @color
        end
    end

    def delete
        @color = Color.find(parmas[:id])
        if params[:password] == @color.user.password
            @color.destroy
        end
    end
end