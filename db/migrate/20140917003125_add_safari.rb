class AddSafari < ActiveRecord::Migration
  def change
    add_column :assignments, :safari, :boolean, default: false
    add_column :contexts,    :safari, :boolean, default: false
    add_index  :contexts,    :safari
    add_column :suites,      :safari, :boolean, default: false
    add_index  :suites,      :safari
  end
end
