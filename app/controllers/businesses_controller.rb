class BusinessesController < ApplicationController
  def new
    @business = Business.new
  end 

  def index 
    @businesses = Business.all
  end

  def create
    @workflow = CreatesBusiness.new(
      name: params[:business][:name],
      business_type: params[:business][:business_type]
      )
    @workflow.create
    if @workflow.success?
      redirect_to businesses_path
    else
      @business = @workflow.business
      render :new
    end
  end

  def destroy
    Business.find(params[:id]).destroy
    redirect_to request.referrer
  end

  def show
    @business = Business.find(params[:id])
  end
end
