class MediumSerializer < ActiveModel::Serializer
  attributes :id, :title, :date, :url, :comment, :thumbnail_url, :thumbnail_width, :thumbnail_height
end
