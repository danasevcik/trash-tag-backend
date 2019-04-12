class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end


  def create
   @user = User.find_by(username: user_params[:username])
   #User#authenticate comes from BCrypt
   if @user && @user.authenticate(user_params[:password])
    # encode token comes from ApplicationController
    token = encode_token({ user_id: @user.id })
    render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
   else
    render json: { message: 'Invalid username or password' }, status: :unauthorized
   end
  end

  private
  def user_params
    params.require(:user).permit(:name, :picture, :hometown, :current_city, :age, :bio, :username, :password)
  end

end
