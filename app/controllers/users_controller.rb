class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :get_user]

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end


  def create
   @user = User.create(user_params)

   if @user.valid?

    token = encode_token({ user_id: @user.id })
    render json: { user: {username: @user.username}, token: token }, status: :created
   else
    render json: { message: 'Invalid username or password' }, status: :not_acceptable
   end
  end

  def get_user
    token = request.headers["authorization"]
    id = JWT.decode(token, "GG012819GG")[0]["user_id"]
    @user = User.find(id)

    if @user.valid?
      render json: { user: {username: @user.username}}
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :picture, :hometown, :current_city, :age, :bio, :username, :password)
  end

end
