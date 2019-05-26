class JobsController < ApplicationController
  def new
    @job = Job.new
  end

  def index
    @jobs = Job.all
  end

  def create
    @job_workflow = CreatesJob.new(
      title: params[:title],
      description: params[:description],
      pay: params[:pay],
      availability: params[:availability]
    )

    @job_workflow.create
  end
end
