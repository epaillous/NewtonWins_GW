class Article < ApplicationRecord
  scope :published, -> { where(published: true) }
	belongs_to :point
  validates :title, :date, :point, presence: true
end
