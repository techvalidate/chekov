class HideContexts < ActiveRecord::Migration
  def change
    add_column :contexts, :visible, :boolean, default: true
    add_index  :contexts, [:release_id, :visible]
  end
end
