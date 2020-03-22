class CreateJoinTableCourseUser < ActiveRecord::Migration[6.0]
  def change
    create_join_table :courses, :users do |t|
      t.index [:course_id, :user_id], unique: true
      t.index [:user_id, :course_id], unique: true
      t.index :course_id
      t.index :user_id
    end
  end
end
