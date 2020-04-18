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
class AssignmentUser < ApplicationRecord
  belongs_to :assignment
  belongs_to :user

  has_one :assignment_user_result

  has_many :assignment_user_files
  has_many :assignment_user_private_results
  has_many :assignment_user_public_results

  enum status: [:processing, :processed, :error]
  enum compilation_error: [:not_compiled, :passed, :failed]

  has_one_attached :public_zip_result
  has_one_attached :private_zip_result
  has_one_attached :compilation_file

  accepts_nested_attributes_for :assignment_user_files, reject_if: :all_blank, allow_destroy: true

  after_create :assign_as_result

  def review
    host = ENV.fetch("ENV_URL")
    course_id = self.assignment.course.id
    assignment_id = self.assignment.id
    docker_image = self.assignment.docker_image
    private_url = self.assignment.private_files.service_url
    public_url = self.assignment.public_files.service_url
    code_urls = self.assignment_user_files.map { |au_file| au_file.file.service_url }
    code_name = self.assignment.assignment_files.map{ |a_file| a_file.name}
    makefile_url = self.assignment.makefile.service_url

    ReviewAssignmentJob.perform_later(self, course_id, assignment_id, host, docker_image, private_url, public_url, code_urls, code_name, makefile_url)
  end

  def assign_as_result
    assignment_user_result = AssignmentUserResult.find_by(assignment: self.assignment, user: self.user)
    if assignment_user_result
      assignment_user_result.update(assignment_user: self)
    else
      AssignmentUserResult.create(assignment_user: self, assignment: self.assignment, user: self.user)
    end
  end
end
