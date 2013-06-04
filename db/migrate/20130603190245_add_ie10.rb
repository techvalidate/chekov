class AddIe10 < ActiveRecord::Migration
  def change
    add_column :assignments, :ie10, :boolean, :default=>false
    add_column :contexts,    :ie10, :boolean, :default=>false
    add_index  :contexts,    :ie10
    add_column :suites,      :ie10, :boolean, :default=>false
    add_index  :suites,      :ie10
  end
end
