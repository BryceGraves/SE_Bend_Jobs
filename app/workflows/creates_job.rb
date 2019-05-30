class CreatesJob
  attr_accessor :title, :description, :pay, :available, :job

  def initialize(title: "", description: "", pay: "", available: true)
    @title = title
    @description = description
    @pay = pay
    @available = available
  end

  def build
    self.job = Job.new(title: title, description: description, pay: pay, available: available)
    job
  end

  def create
    build
    result = job.save
    @success = result
  end

end
