class AddPositionToStories < ActiveRecord::Migration
  def change
    add_column :elements, :position, :integer, :default=>0
    add_index  :elements, :position
  end
end
