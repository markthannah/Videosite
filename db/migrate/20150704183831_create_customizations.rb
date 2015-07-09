class CreateCustomizations < ActiveRecord::Migration
  def change
    create_table :customizations do |t|
      t.integer :video_id
      t.integer :custom_page_id

      t.timestamps null: false
    end
  end
end
