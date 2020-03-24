# == Schema Information
#
# Table name: assignment_users
#
#  id            :bigint           not null, primary key
#  assignment_id :bigint           not null
#  user_id       :bigint           not null
#  public_score  :integer          default("0")
#  private_score :integer          default("0")
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class AssignmentUser < ApplicationRecord
  belongs_to :assignment
  belongs_to :user

  has_many :assignment_user_files

  enum status: [:processing, :processed, :error]


  accepts_nested_attributes_for :assignment_user_files, reject_if: :all_blank, allow_destroy: true
end
