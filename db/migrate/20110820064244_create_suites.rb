class CreateSuites < ActiveRecord::Migration
  def change
    create_table :suites do |t|
      t.integer :user_id, :story_id
      t.timestamps
    end
    
    add_index :suites, :story_id
    
  end
  
end
