class CreateCustomPages < ActiveRecord::Migration
  def change
    create_table :custom_pages do |t|
      t.string :greeting
      t.string :message

      t.timestamps null: false
    end
  end
end
