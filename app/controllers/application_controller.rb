class ApplicationController < ActionController::API
  def encode_token(payload)
    JWT.encode(payload, SECRET_KEY)
  end

  def decoded_token(token)
    JWT.encode(payload, SECRET_KEY)[0]
  end
end
