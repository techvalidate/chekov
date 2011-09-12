class AddDescriptionToContexts < ActiveRecord::Migration
  def change
    add_column :contexts, :description, :text
  end
end
