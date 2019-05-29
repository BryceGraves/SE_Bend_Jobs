class BusinessesController < ApplicationController
  def new
    @business = Business.new
  end 

  def index 
    @businesses = Business.all
  end

  def create
    @workflow = CreatesBusiness.new(name: params[:business][:name])
    @workflow.create
    if @workflow.success?
      redirect_to businesses_path
    else
      @business = @workflow.business
      render :new
    end
  end
end
