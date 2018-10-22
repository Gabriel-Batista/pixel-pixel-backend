class FramesController < ApplicationController
    def show
        @frame = Frame.find(params[:id])
        render json: @frame
    end

    def create
        @new_frame = Frame.new(base64: params[:base64])
    end

    def update
        @frame = Frame.find(params[:id])
        @frame.update(base64: params[:base64])
        render json: @frame
    end

    def destroy
        @frame = Frame.find_by(local_id: params[:id])
        @frame.destroy
        render json: {success: "frame #{params[:id]} was destroyed"}
    end
end