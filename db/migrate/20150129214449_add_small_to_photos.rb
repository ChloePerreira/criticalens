class AddSmallToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :small, :string
    add_column :photos, :small_320, :string
    add_column :photos, :medium_640, :string
    add_column :photos, :medium_800, :string
    add_column :photos, :large_square, :string
  end
end
