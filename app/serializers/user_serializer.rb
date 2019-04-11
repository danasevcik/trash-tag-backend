class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :picture, :hometown, :current_city, :age, :bio
end
