class CreatesBusiness
  attr_accessor :name, :business

  def initialize(name: "")
    @name = name
  end

  def success?
    @success
  end

  def build
    self.business = Business.new(name: name)
    business
  end

  def create
    build
    result = business.save
    @success = result
  end
end
