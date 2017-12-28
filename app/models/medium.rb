class Medium < ApplicationRecord
  validates :point, :url, presence: true
  belongs_to :point
end
