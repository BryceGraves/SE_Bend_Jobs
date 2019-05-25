class JobsController < ApplicationController
  def new
    @job = Job.new
  end
  # def index
  #   @jobs = Job.all
  # end
end
