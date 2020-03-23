class ProfessorSubscription < ApplicationRecord
  belongs_to :professor
  belongs_to :course

  enum state: [:awaiting, :rejected, :approved]
end
