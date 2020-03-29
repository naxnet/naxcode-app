# == Schema Information
#
# Table name: assignment_user_public_results
#
#  id                 :bigint           not null, primary key
#  name               :string(255)
#  diff               :string(255)
#  status             :boolean          default("0")
#  assignment_user_id :bigint           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class AssignmentUserPublicResult < ApplicationRecord
  belongs_to :assignment_user
end
