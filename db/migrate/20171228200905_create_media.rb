class CreateMedia < ActiveRecord::Migration[5.1]
  def change
    create_table :media do |t|
      t.string :title
      t.string :url
      t.date :date
      t.text :comment
      t.references :point
      t.timestamps
    end
  end
end
