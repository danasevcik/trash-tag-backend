class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :date, :story, :start_image, :end_image, :completed, :time
end
