class CreatesBusiness
  attr_accessor :name, :business_type, :business

  def initialize(name: "", business_type: "")
    @name = name
    @business_type = business_type
  end

  def success?
    @success
  end

  def build
    self.business = Business.new(name: name, business_type: business_type)
    business
  end

  def create
    build
    result = business.save
    @success = result
  end
end
