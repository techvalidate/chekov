class RemoveElementPosition < ActiveRecord::Migration
  def up
    remove_column :elements, :position
  end

  def down
    add_column :elements, :position, :integer
    add_index  :elements, :position
  end
end
