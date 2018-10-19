class FramesController < ApplicationController
    def show
        @frame = Frame.find(params[:id])
        render json: @frame
    end

    def create
        @new_frame = Frame.new(base64: params[:base64])
    end

    def edit
        @frame = Frame.find(params[:id])
        @frame.update(base64: params[:base64])
        render json: @frame
    end

    def delete
        @frame = Frame.find(params[:id])
        @frame.destroy
    end
end