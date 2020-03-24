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
require 'test_helper'

class AssignmentUserFileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
