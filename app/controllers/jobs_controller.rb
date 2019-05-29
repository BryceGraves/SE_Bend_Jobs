class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
    byebug
  end

  def create
    byebug
    @job_workflow = CreatesJob.new(
      title: params[:job][:title],
      description: params[:job][:description],
      pay: params[:job][:pay],
      availability: params[:availability]
    )

    @job_workflow.create

    redirect_to jobs_path
  end
  
end
