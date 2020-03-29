# == Schema Information
#
# Table name: assignment_users
#
#  id                :bigint           not null, primary key
#  assignment_id     :bigint           not null
#  user_id           :bigint           not null
#  public_score      :integer          default("0")
#  private_score     :integer          default("0")
#  status            :integer          default("0")
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  public_n_exps     :integer          default("0")
#  private_n_exps    :integer          default("0")
#  compilation_error :integer          default("0")
#
require 'test_helper'

class AssignmentUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
