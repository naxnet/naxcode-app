class CreateAssignmentUserPublicResults < ActiveRecord::Migration[6.0]
  def change
    create_table :assignment_user_public_results do |t|
      t.string :name
      t.text :diff
      t.boolean :status, default: false
      t.references :assignment_user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
