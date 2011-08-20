class Indexes < ActiveRecord::Migration
  def change
    add_index :contexts, :release_id
    add_index :stories, :context_id
    add_index :elements, :story_id
    add_index :elements, :position
  end
end
