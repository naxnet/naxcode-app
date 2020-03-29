# == Schema Information
#
# Table name: assignment_user_private_results
#
#  id                 :bigint           not null, primary key
#  name               :string(255)
#  diff               :string(255)
#  status             :boolean
#  assignment_user_id :bigint           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class AssignmentUserPrivateResult < ApplicationRecord
  belongs_to :assignment_user
end
