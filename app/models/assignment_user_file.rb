# == Schema Information
#
# Table name: assignment_user_files
#
#  id                 :bigint           not null, primary key
#  assignment_user_id :bigint           not null
#  assignment_file_id :bigint           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class AssignmentUserFile < ApplicationRecord
  belongs_to :assignment_user
  belongs_to :assignment_file

  has_one_attached :file
end
