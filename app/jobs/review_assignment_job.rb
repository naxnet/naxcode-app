class ReviewAssignmentJob < ApplicationJob
  queue_as :default

  def perform(*args)
    assignment_user = args
    system("make run DOCKER_IMAGE=openjdk:latest DOCKER_CONTAINER_NAME=test1 -f ./vendor/Makefile")


  end
end
