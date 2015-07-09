class AddUserIdToCustomPages < ActiveRecord::Migration
  def change
    add_column :custom_pages, :user_id, :integer
  end
end
