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
require 'test_helper'

class AssignmentFileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
