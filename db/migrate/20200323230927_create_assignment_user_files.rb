class CreateAssignmentUserFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :assignment_user_files do |t|
      t.references :assignment_user, null: false, foreign_key: true, index: true
      t.references :assignment_file, null: false, foreign_key: true, index: true

      t.index [:assignment_user_id, :assignment_file_id], unique: true, name: "auf_au_id_af_id_index"
      t.index [:assignment_file_id, :assignment_user_id], unique: true, name: "auf_af_id_au_id_index"

      t.timestamps
    end
  end
end
