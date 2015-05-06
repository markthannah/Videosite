class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :description
      t.string :title

      t.timestamps null: false
    end
  end
end
