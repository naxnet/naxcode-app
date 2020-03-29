class CreateAssignmentUserResults < ActiveRecord::Migration[6.0]
  def change
    create_table :assignment_user_results do |t|
      t.references :assignment, null: false, foreign_key: true, index: true
      t.references :user, null: false, foreign_key: true, index: true
      t.references :assignment_user, null: false, foreign_key: true, index: true, unique: true

      t.index [:assignment_id, :user_id], unique: true
      t.index [:user_id, :assignment_id], unique: true

      t.timestamps
    end
  end
end
