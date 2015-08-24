class AddCporderToCustomPages < ActiveRecord::Migration
  def change
    add_column :custom_pages, :cporder, :integer
  end
end
