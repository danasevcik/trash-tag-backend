class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :get_user, :find]

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

  def find
    @user = User.find_by(username: user_params[:username])
    if !!@user
      token = encode_token({ user_id: @user.id })
      render json: { user: {username: @user.username, user_id: @user.id, name: @user.name, picture: @user.picture, hometown: @user.hometown, current_city: @user.current_city, age: @user.age, bio: @user.bio}, token: token }, status: :found
    else
      render json: { message: 'Invalid username or password' }, status: :not_acceptable
    end
  end



  def get_user
    token = request.headers["authorization"]
    id = JWT.decode(token, "GG012819GG")[0]["user_id"]
    @user = User.find(id)

    if @user.valid?
      render json: { user: {username: @user.username, user_id: @user.id, name: @user.name, picture: @user.picture, hometown: @user.hometown, current_city: @user.current_city, age: @user.age, bio: @user.bio}}
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(name: params[:user][:name], picture: params[:user][:picture], hometown: params[:user][:hometown], current_city: params[:user][:current_city], age: params[:user][:age], bio: params[:user][:bio])
    render json: @user
  end

  private
  def user_params
    params.require(:user).permit(:name, :picture, :hometown, :current_city, :age, :bio, :username, :password)
  end

end
