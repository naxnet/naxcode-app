class UserSubscription < ApplicationRecord
  belongs_to :user
  belongs_to :course

  enum state: [:awaiting, :rejected, :approved]
end
