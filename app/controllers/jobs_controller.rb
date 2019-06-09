class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def new
    @business_id = params[:business_id] 
    @job = Job.new
  end

  def create
    @job_workflow = CreatesJob.new(
      title: params[:job][:title],
      description: params[:job][:description],
      pay: params[:job][:pay],
      available: params[:availability],
      business_id: params[:business_id]
    )
    
    begin
      @job_workflow.create  
    rescue StandardError => err
      @job = @job_workflow.job
      render :new
      return
    end
    
    redirect_to controller: 'businesses', action: 'show', id: params[:business_id]
  end
  
end
