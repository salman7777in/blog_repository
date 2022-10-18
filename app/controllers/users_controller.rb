class UsersController < ApplicationController
    before_action :set_params, only: [:edit, :update, :show]
    def new
        @user= User.new
    end
    def create
       @user= User.new(user_params) 
       if @user.save
        flash[:success] = "Welcome to the alpha blog #{@user.username}"
        redirect_to articles_path
        else
        render 'new'
        end
    end
    def update
   
        if @user.update(user_params)
            flash[:success] = "user was updated"
            redirect_to articles_path
        else
            flash[:success] = "user was not updated"
            render 'edit'
        end
    end
    def edit

    end
    def show

    end





    private
    
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
    def set_params
        @user= User.find(params[:id])
    end
end
