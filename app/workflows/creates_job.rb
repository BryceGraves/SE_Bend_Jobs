class CreatesJob
  attr_accessor :title, :job, :description, :availability

  def initialize(title: "", description: "", pay: "", availability: availability)
    @title = title
    @description = description
    @pay = pay
    @availability = availability
  end

  def build
    self.job = Job.new(
      title: title, 
      description: description, 
      pay: pay, 
      availability: availability_as_bool(availability)
    )
    job
  end

  def create
    build
    job.save
  end

  # def convert_string_to_description
  #   description_string.split("\n").map do |one_description|
  #     title, pay, description, availability = one_description.split(":")
  #     pay_as_integer(pay)
  #     Job.new(title: title, pay: pay_as_integer(pay), description: description, available: availability_as_bool(available))
  #   end
  # end

  def pay_as_integer(pay)
    return 1 if pay.blank?
    [pay.to_i, 1].max
  end

  def availability_as_bool(availability)
    availability == "available" ? true : false
  end
end
