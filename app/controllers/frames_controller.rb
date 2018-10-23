class FramesController < ApplicationController
    def show
        @frame = Frame.find(params[:id])
        render json: @frame
    end

    def create
        @project = Project.find(params[:project_id])
        @new_frame = @project.frames.create(local_id: params[:frame_id], base64: params[:base64])
        render json: @new_frame
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