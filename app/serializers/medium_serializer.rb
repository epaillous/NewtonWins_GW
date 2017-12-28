class MediumSerializer < ActiveModel::Serializer
  attributes :id, :title, :date, :url, :comment
end
