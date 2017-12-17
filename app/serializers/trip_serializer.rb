class TripSerializer < ActiveModel::Serializer
  attributes :id, :transport_mode, :date
  has_one :departure, serializer: PointSerializer
  has_one :arrival, serializer: PointSerializer
end
