class Suggestion < ApplicationRecord
belongs_to :point
accepts_nested_attributes_for :point

end
