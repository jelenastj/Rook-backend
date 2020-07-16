class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]
  
  def create
    puts params
    #this is hit when a user logs in
    @user = User.find_by(username: params[:user][:username])
    puts @user 
    puts "jkgjlsjgsjgsj"
    if @user && @user.authenticate(params[:user][:password])
      token = encode_token({ user_id: @user.id })
      render json: { user: {username: @user.username, id: @user.id}, jwt: token }, status: :accepted
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized      
    end
  end

  private
 
  def user_login_params
    params.require(:user).permit(:username, :password)
  end
end
