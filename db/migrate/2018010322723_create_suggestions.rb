class CreateSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :suggestions do |t|
      t.string :name
      t.text :address
      t.text :comment
      t.references :point
      t.references :suggestion_type
      t.timestamps
    end
  end
end
