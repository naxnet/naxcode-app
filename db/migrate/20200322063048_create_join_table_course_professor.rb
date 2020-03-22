class CreateJoinTableCourseProfessor < ActiveRecord::Migration[6.0]
  def change
    create_join_table :courses, :professors do |t|
      t.index [:course_id, :professor_id], unique: true
      t.index [:professor_id, :course_id], unique: true
      t.index :course_id
      t.index :professor_id
    end
  end
end
