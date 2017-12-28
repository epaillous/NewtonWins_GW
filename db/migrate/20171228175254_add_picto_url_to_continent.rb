class AddPictoUrlToContinent < ActiveRecord::Migration[5.1]
  def change
    add_column :continents, :picto_url, :string
  end
end
