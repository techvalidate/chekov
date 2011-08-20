class CreateElements < ActiveRecord::Migration
  def change
    create_table :elements do |t|
      t.integer :story_id
      t.text :description
      t.integer :position
      t.timestamps
    end    
  end
end
