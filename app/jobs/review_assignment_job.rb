class ReviewAssignmentJob < ApplicationJob
  queue_as :default

  def perform(*args)
    assignment_user, docker_image, private_url, public_url, code_urls, code_name, makefile_url = args
    container_name = "#{((Time.now.to_i * rand())).to_i.to_s}-autoreview-app"

    code_urls = code_urls.join(' ')
    code_name = code_name.join(' ')

    cmd = "make run DOCKER_IMAGE=#{docker_image} DOCKER_CONTAINER_NAME=#{container_name} PUBLIC_ZIP_URL='#{public_url}' PRIVATE_ZIP_URL='#{private_url}' MAKEFILE_URL='#{makefile_url}' CODE_URLS='#{code_urls}' CODE_NAMES='#{code_name}'  -f ./vendor/Makefile"
    # p cmd


    system(cmd)
  end
end
