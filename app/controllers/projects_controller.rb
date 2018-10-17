class ProjectsController < ApplicationController
    def show
        @project = Project.find(params[:id])
        render json: @project
    end

    def create
        @new_project = Project.new(user_id: params[:user_id], name: params[:name])
        if @new_project.save
            params[:frames].each do |base64|
                @new_project.frames.create(base64: base64)
            end
            render json: @new_project
        end
    end

    def edit
        @project = Project.find(params[:id])
        if params[:password] == @project.user.password
            @project.update(name: params[:name])
            render json: @project
        end
    end

    def delete
        @project = Project.find(params[:id])
        if params[:password] == @project.user.password
            @project.destroy
            render json: {success: "#{@project.id} was destroyed."}
        end
    end
end