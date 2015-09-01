class AddAttachmentImageToCustomPages < ActiveRecord::Migration
  def self.up
    change_table :custom_pages do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :custom_pages, :image
  end
end
