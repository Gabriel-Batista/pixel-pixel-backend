class UsersController < ApplicationController
    def projects
        @projects = User.find_by(username: params[:username]).projects
        render json: @projects
    end
    
    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def create
        @user = User.new(username: params[:username], password: params[:password])
        if @user.save
            render json: @user
        else
            render json: {error: "Username has already been taken"}
        end
    end

    def update
        @user = User.find(params[:id])
        @user.update(username: params[:username], password: params[:new_password])
        render json: @user
    end

    def delete
        @user = User.find(params[:id])
        @user.destroy
        render json: {success: "#{@user.id} was destroyed."}
    end
end