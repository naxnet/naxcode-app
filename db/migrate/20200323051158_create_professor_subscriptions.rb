class CreateProfessorSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :professor_subscriptions do |t|
      t.references :professor, null: false, foreign_key: true, index: true
      t.references :course, null: false, foreign_key: true, index: true
      t.integer :state, default: 0

      t.index [:course_id, :professor_id], unique: true
      t.index [:professor_id, :course_id], unique: true

      t.timestamps
    end
  end
end
