class AddImagesToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :large_image_url, :string
    add_column :books, :small_image_url, :string
  end
end
