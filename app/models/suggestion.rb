class Suggestion < ApplicationRecord
  belongs_to :point, dependent: :destroy
  belongs_to :user
  belongs_to :suggestion_type
  accepts_nested_attributes_for :point
  validates :point, :user, :suggestion_type, presence: true
end
