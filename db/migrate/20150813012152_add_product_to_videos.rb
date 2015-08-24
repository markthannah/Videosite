class AddProductToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :product, :string
  end
end
