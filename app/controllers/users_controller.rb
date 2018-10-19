class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def create
        @new_user = User.new(username: params[:username], password: params[:password])
        if @new_user.save
            render json: @new_user
        else
            render json: {error: "Username has already been taken"}
        end
    end

    def edit
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