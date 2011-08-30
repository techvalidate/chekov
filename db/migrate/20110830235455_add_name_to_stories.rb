class AddNameToStories < ActiveRecord::Migration
  def up
    add_column :stories, :name, :string
    Story.update_all "name = description"
    Story.update_all "description = null"
  end
  
  def down
    remove_column :stories, :name
  end
end
