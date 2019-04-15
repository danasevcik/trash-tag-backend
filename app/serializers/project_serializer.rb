class ProjectSerializer < ActiveModel::Serializer
    # send back all attributes and users
  attributes :id, :name, :location, :date, :story, :start_image, :end_image, :completed, :time, :volunteers
end
