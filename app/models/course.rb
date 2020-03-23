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
  has_many :professor_subscriptions
  has_many :user_subscriptions

  has_and_belongs_to_many :professors
  has_and_belongs_to_many :users

  before_create :add_short_id


  private
    def add_short_id
      hashids = Hashids.new("PASSWORD")
      hash = hashids.encode(Time.now())

      while Course.where(short_id: hash).count() != 0
        hash = hashids.encode(Time.now)
      end
      self.short_id = hash
    end
end
