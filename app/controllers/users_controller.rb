class UsersController < ApplicationController

    before_action :require_logged_out, only: [:new, :create]
    # we dont want users who are logged in to try to sign up again
    before_action :require_logged_in, only: [:index, :show]
    # we only want users who are logged in to access the main part of our app

    def index
        @users = User.all # rails does some stuff under the hood to pass it to the view
        render :index
    end

    def show
        @user = User.find(params[:id])
        render :show
    end

    def new 
        @user = User.new
        render :new #not needed, rails already knows and will try and match the method name in the views
    end

    def create 
        # fail
        # debugger
        @user = User.new(user_params)
        
        if @user.save
            login(@user) 
            redirect_to user_url(@user)
        else  
            # debugger

            flash.now[:errors] = @user.errors.full_messages
            render :new
            # debugger
        end
    end

    def edit 
        @user = User.find(params[:id])
        render :edit
    end

    def update 
        # render json: "UPDATED!!!"
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_url(@user)
        else  
            render json: @user.errors.full_messages, status: 422
        end
    end

    private 
    
    def user_params
        params.require(:user).permit(:username, :password, :email, :age)
    end
end