class ProjectsController < ApplicationController
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
            params[:frames].each do |base64|
                @new_project.frames.create(base64: base64)
            end
            render json: @new_project
        else
            render json: @new_project.errors
        end

    end

    def edit
        @project = Project.find(params[:id])
        @project.update(name: params[:name])
        render json: @project
    end

    def delete
        @project = Project.find(params[:id])
        @project.destroy
        render json: {success: "#{@project.id} was destroyed."}
    end
end