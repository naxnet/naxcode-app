class AddPublicNExpsAndPrivateNExpsToAssignmentUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :assignment_users, :public_n_exps, :integer, default: 0
    add_column :assignment_users, :private_n_exps, :integer, default: 0
    add_column :assignment_users, :compilation_error, :integer, default: 0
  end
end
