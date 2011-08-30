class AddBrowsersToContexts < ActiveRecord::Migration
  def up
    add_column :contexts, :ie6,    :boolean, default: true
    add_column :contexts, :ie8,    :boolean, default: true
    add_column :contexts, :ie9,    :boolean, default: true
    add_column :contexts, :ff,     :boolean, default: true
    add_column :contexts, :chrome, :boolean, default: true
    
    add_index :contexts, :ie6
    add_index :contexts, :ie8
    add_index :contexts, :ie9
    add_index :contexts, :ff
    add_index :contexts, :chrome
  end

  def down
    remove_column :contexts, :ie6
    remove_column :contexts, :ie8
    remove_column :contexts, :ie9
    remove_column :contexts, :ff
    remove_column :contexts, :chrome
  end
end
