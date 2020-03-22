class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.datetime :deleted_at, index: true
      t.timestamps
    end
  end
end
