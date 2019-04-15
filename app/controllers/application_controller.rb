class ApplicationController < ActionController::API
  before_action :authorized

  def encode_token(payload)
    JWT.encode(payload, "GG012819GG")
  end

  def auth_header
    # byebug
    request.headers['Authorization']
  end

  def decoded_token
    # byebug
    if auth_header
      token = auth_header
      begin
        JWT.decode(token, "GG012819GG", true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def curr_user
    # byebug
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    !!curr_user
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end
end
