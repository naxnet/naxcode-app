# == Schema Information
#
# Table name: assignment_files
#
#  id            :bigint           not null, primary key
#  name          :string(255)
#  description   :string(255)
#  assignment_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class AssignmentFile < ApplicationRecord
  belongs_to :assignment

  has_many :assignment_user_files
end
