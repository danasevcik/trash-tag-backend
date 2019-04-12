class UserSerializer < ActiveModel::Serializer
  # send back all attributes and projects
  attributes :id, :name, :picture, :hometown, :current_city, :age, :bio, :projects, :username
end
