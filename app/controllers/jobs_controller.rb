class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def new
    @business_id = params[:business_id] 
    @job = Job.new
  end

  def create
    byebug
    @job_workflow = CreatesJob.new(
      title: params[:job][:title],
      description: params[:job][:description],
      pay: params[:job][:pay],
      available: params[:available],
      business_id: params[:business_id]
    )

    @job_workflow.create

    redirect_to controller: 'businesses', action: 'show', id: @business_id
  end
  
end
