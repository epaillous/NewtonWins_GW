class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :subtitle, :date, :content, :main_image_url
  has_one :point
end
