class AddUserToSuggestion < ActiveRecord::Migration[5.1]
  def change
    add_reference :suggestions, :user, index: true
  end
end
