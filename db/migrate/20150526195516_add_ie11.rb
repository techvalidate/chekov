class AddIe11 < ActiveRecord::Migration
  def change
    add_column :assignments, :ie11, :boolean, default: false
    add_column :contexts,    :ie11, :boolean, default: false
    add_index  :contexts,    :ie11
    add_column :suites,      :ie11, :boolean, default: false
    add_index  :suites,      :ie11
  end
end
