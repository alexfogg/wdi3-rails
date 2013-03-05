class UsersController < ApplicationController
  def index
    @users = User.order(:name)
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to(users_path)
    end
  end
  def show
  end
  def edit
  end
  def update
  end
  def destroy
  end
end