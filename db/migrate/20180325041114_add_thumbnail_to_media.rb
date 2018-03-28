class AddThumbnailToMedia < ActiveRecord::Migration[5.1]
  def change
    add_column :media, :thumbnail_url, :string
    add_column :media, :thumbnail_width, :integer
    add_column :media, :thumbnail_height, :integer  
  end
end
