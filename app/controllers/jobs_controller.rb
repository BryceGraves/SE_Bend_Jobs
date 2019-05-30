class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def new
    @business_id = params[:business_id] 
    @job = Job.new
    byebug
  end

  def create
    @job_workflow = CreatesJob.new(
      title: params[:job][:title],
      description: params[:job][:description],
      pay: params[:job][:pay],
      available: params[:available],
      business_id: @business_id
    )

    @job_workflow.create

    redirect_to jobs_path
  end
  
end
