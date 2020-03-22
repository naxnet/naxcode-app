class Assignment < ApplicationRecord
  # soft-delete
  acts_as_paranoid
  
  belongs_to :course
end
