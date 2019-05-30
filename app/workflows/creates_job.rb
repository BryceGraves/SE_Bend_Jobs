class CreatesJob
  attr_accessor :title, :description, :pay, :available, :job

  def initialize(title: "", description: "", pay: "", available: true, business_id: "")
    @title = title
    @description = description
    @pay = pay
    @available = string_to_bool(available)
    @business_id = business_id
  end

  def build
    self.job = Job.new(title: title, description: description, pay: pay, available: available)
    job
  end

  def string_to_bool(available)
    if available == "true"
      true
    elsif available == "false"
      false
    else
      available
    end
  end

  def create
    business = Business.find(@business_id)
    business.jobs << build
    job.save!
  end

end
