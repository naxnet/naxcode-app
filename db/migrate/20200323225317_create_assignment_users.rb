class CreateAssignmentUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :assignment_users do |t|
      t.references :assignment, null: false, foreign_key: true, index: true
      t.references :user, null: false, foreign_key: true, index: true
      t.integer :public_score, default: 0
      t.integer :private_score, default: 0
      t.integer :status, default: 0

      t.index [:assignment_id, :user_id]
      t.index [:user_id, :assignment_id]

      t.timestamps
    end
  end
end
