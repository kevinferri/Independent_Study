class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :class_name
      t.string :class_code
      t.string :assignment_name
      t.string :assignment_description
      t.integer :user_id

      t.timestamps
    end
    add_index :assignments, [:user_id, :created_at]
  end
end
