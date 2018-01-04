class CreateSuggestionTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :suggestion_types do |t|
      t.string :title
      t.text :description
      t.timestamps
    end
  end
end
