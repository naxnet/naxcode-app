class AssignmentUserResult < ApplicationRecord
  belongs_to :assignment
  belongs_to :user
  belongs_to :assignment_user
end
