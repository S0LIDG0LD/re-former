class UsersController < ApplicationController
  def create
    # @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    @user = User.new(allowed_post_params)
  if @user.save
    # flash[:success] = "Great! Your post has been created!"
    redirect_to new_user_path
  else
    # flash.now[:error] = "Rats! Fix your mistakes, please."
    render :new, status: :unprocessable_entity
  end
  end

  def new
    @user = User.new
    # render :new
  end

  def allowed_post_params
      params.expect(user: [:username, :email, :password])
    end

end
