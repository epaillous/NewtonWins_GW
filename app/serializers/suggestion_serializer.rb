class SuggestionSerializer < ActiveModel::Serializer
  attributes :id, :comment, :address, :name
  has_one :point
  has_one :suggestion_type
end
