class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def create
        @new_user = User.new(username: params[:username], password: params[:password])
        if @new_user.save
            render json: @new_user
        end
    end

    def edit
        @user = User.find(params[:id])
        if params[:password] == @user.password
            @user.update(username: params[:username], password: params[:new_password])
        end
        render json: @user
    end

    def delete
        @user = User.find(params[:id])
        if params[:password] == @user.password
            @user.destroy
            render json: {success: "#{@user.id} was destroyed."}
        end
    end
end