class UsersController < ApplicationController
  def create
    # @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    @user = User.new(allowed_post_params)
    if @user.save
      flash[:success] = "Great! Your post has been created!"
      redirect_to new_user_path
    else
      flash.now[:error] = "Rats! Fix your mistakes, please."
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @user = User.new
    # render :new
  end

  def show
  end

  def edit
    id = params[:id]
    unless id.nil?
      @user = User.find(id)
    else
      @user = User.new
    end
    # render :edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(allowed_patch_params)
      flash[:success] = "Great! Your post has been updated!"
      redirect_to new_user_path
    else
      flash.now[:error] = "Rats! Fix your mistakes, please."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private # Best to make helper methods like this one private

  def allowed_post_params
    params.expect(user: [ :username, :email, :password ])
  end

  def allowed_patch_params
    params.expect(user: [ :id, :username, :email, :password ])
  end
end
