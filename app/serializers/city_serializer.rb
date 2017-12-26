class CitySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :country, serializer: CountrySerializer
end
