class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.string :name
      t.references :course, null: false, foreign_key: true, index: true
      t.timestamp :init_time
      t.timestamp :end_time


      t.datetime :deleted_at, index: true
      t.timestamps
    end
  end
end
