class VolunteerSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :project_id, :admin
end
