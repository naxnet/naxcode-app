# == Schema Information
#
# Table name: courses
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  short_id   :string(255)
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
