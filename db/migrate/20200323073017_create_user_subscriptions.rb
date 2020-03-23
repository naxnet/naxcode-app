class CreateUserSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_subscriptions do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :course, null: false, foreign_key: true, index: true
      t.integer :state, default: 0

      t.index [:course_id, :user_id], unique: true
      t.index [:user_id, :course_id], unique: true


      t.timestamps
    end
  end
end
