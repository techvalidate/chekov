class CreateTests < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.integer :suite_id, :element_id
      t.boolean :passed, default: false
      t.timestamps
    end
    
    add_index :checks, :suite_id
    add_index :checks, :element_id
  end
end
