class RemoveIe6 < ActiveRecord::Migration
  def up
    remove_column :assignments, :ie6
    remove_column :contexts, :ie6
    remove_column :suites, :ie6
  end

  def down
    add_column :assignments, :ie6, :boolean, :default=>false
    add_column :contexts, :ie6, :boolean, :default=>false
    add_column :suites, :ie6, :boolean, :default=>false
  end
end
