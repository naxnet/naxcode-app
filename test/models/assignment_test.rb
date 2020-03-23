# == Schema Information
#
# Table name: assignments
#
#  id                        :bigint           not null, primary key
#  name                      :string(255)
#  course_id                 :bigint           not null
#  init_time                 :datetime
#  end_time                  :datetime
#  docker_image              :string(255)
#  revision_grade_percentage :integer
#  private_grade_percentage  :integer
#  deleted_at                :datetime
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
