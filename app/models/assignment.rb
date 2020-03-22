# == Schema Information
#
# Table name: assignments
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  course_id  :bigint           not null
#  init_time  :datetime
#  end_time   :datetime
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Assignment < ApplicationRecord
  # soft-delete
  acts_as_paranoid
  
  belongs_to :course
end
