# == Schema Information
#
# Table name: user_subscriptions
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  course_id  :bigint           not null
#  state      :integer          default("0")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserSubscription < ApplicationRecord
  belongs_to :user
  belongs_to :course

  enum state: [:awaiting, :rejected, :approved]
end
