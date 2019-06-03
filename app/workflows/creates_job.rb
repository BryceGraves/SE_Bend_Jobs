class CreatesJob
  attr_accessor :title, :description, :pay, :available, :job

  def initialize(title: "", description: "", pay: "", available: true, business_id: -1)
    @title = title
    @description = description
    @pay = pay
    @available = ActiveModel::Type::Boolean.new.cast(available)
    @business_id = business_id
  end

  def build
    self.job = Job.new(title: title, description: description, pay: pay, available: available)
    job
  end

  def create
    business = Business.find(@business_id)
    business.jobs << build
    job.save!
  end

end
