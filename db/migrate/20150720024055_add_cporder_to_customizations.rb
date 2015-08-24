class AddCporderToCustomizations < ActiveRecord::Migration
  def change
    add_column :customizations, :cporder, :integer
  end
end
