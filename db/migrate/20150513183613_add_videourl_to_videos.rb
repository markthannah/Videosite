class AddVideourlToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :videourl, :string
  end
end
