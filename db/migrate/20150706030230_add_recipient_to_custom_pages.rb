class AddRecipientToCustomPages < ActiveRecord::Migration
  def change
    add_column :custom_pages, :recipient, :string
  end
end
