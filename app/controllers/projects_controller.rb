class ProjectsController < ApplicationController
    def frames
        @frames = Project.find(params[:id]).frames
        render json: @frames
    end

    def show
        @project = Project.find(params[:id])
        render json: @project
    end

    def create
        begin
            user_id = JWT.decode(params[:token], "1756tech7788learn0891money", true)
        rescue JWT::DecodeError
            nil
        end
        @new_project = Project.new(user_id: user_id[0]["user_id"], name: params[:name])
        if @new_project.save
            params[:frames].each do |key, frame|
                @new_project.frames.create(local_id: frame["id"], base64: frame["base64"])
            end
            render json: @new_project
        else
            render json: @new_project.errors
        end
    end

    def update
        @project = Project.find(params[:id])
        @project.update(name: params[:name])
        @frame= Frame.find_by(local_id: params[:frameId])
        @frame.update(base64: params[:frame])
        render json: @project
    end

    def destroy
        @project = Project.find(params[:id])
        @project.destroy
        render json: {success: "#{@project.id} was destroyed."}
    end
end