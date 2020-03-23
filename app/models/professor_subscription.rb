# == Schema Information
#
# Table name: professor_subscriptions
#
#  id           :bigint           not null, primary key
#  professor_id :bigint           not null
#  course_id    :bigint           not null
#  state        :integer          default("0")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class ProfessorSubscription < ApplicationRecord
  belongs_to :professor
  belongs_to :course

  enum state: [:awaiting, :rejected, :approved]
end
