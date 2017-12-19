class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.text :content
      t.string :title
      t.string :subtitle
      t.date :date
      t.boolean :published, default: false
      t.string :main_image_url
      t.references :point
      t.timestamps
    end
  end
end
