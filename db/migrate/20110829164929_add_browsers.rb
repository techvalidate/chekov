class AddBrowsers < ActiveRecord::Migration
  def up
    add_column :suites, :ie6,    :boolean, default: false
    add_column :suites, :ie8,    :boolean, default: false
    add_column :suites, :ie9,    :boolean, default: false
    add_column :suites, :ff,     :boolean, default: false
    add_column :suites, :chrome, :boolean, default: false
    
    add_index :suites, :ie6
    add_index :suites, :ie8
    add_index :suites, :ie9
    add_index :suites, :ff
    add_index :suites, :chrome
  end

  def down
    remove_column :suites, :ie6
    remove_column :suites, :ie8
    remove_column :suites, :ie9
    remove_column :suites, :ff
    remove_column :suites, :chrome
  end
end
