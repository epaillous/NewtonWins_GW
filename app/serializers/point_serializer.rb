class PointSerializer < ActiveModel::Serializer
  attributes :id, :latitude, :longitude
  has_many :articles, serializer: ArticleOverviewSerializer
  has_one :city
end
