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


  def review
    docker_image = self.assignment.docker_image
    private_url = self.assignment.private_files.service_url
    public_url = self.assignment.private_files.service_url
    code_urls = self.assignment_user_files.map { |au_file| au_file.file.service_url }
    code_name = self.assignment.assignment_files.map{ |a_file| a_file.name}
    makefile_url = self.assignment.makefile.service_url

    ReviewAssignmentJob.perform_later(self, docker_image, private_url, public_url, code_urls, code_name, makefile_url)
  end
end
