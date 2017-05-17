class FearlessFlyer::Product
  attr_accessor :name, :description, :url

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def description
  end

end
