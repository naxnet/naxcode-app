# == Schema Information
#
# Table name: courses
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Course < ApplicationRecord
  # soft-delete
  acts_as_paranoid

  has_many :assignments

  has_and_belongs_to_many :professors
  has_and_belongs_to_many :users
end
