class FearlessFlyer::Product
  attr_accessor :name, :description, :url

  @@all = []

  def initialize(name, url)
    @name = name
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end
end
