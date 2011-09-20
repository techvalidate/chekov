class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :user_id, :context_id
      t.boolean :ie6, :ie8, :ie9, :ff, :chrome, default: false
      t.timestamps
    end
    
    add_index :assignments, :user_id
    add_index :assignments, :context_id
  end
end
