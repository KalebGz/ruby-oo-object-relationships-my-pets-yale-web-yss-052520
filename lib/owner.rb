class Owner
  # code goes here

  attr_reader :name

  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end

  def species(species = "human")
    @species = species
  end

  def say_species
    "I am a #{species}."
  end

  # Class Methods
  def self.all
    @@all
  end
  def self.count
    @@all.length
  end

  def self.reset_all
    self.all.clear
  end

  # Methods that interact with other classes
  def cats
    # binding.pry
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    # binding.pry
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.map {|dog| dog.mood = "happy"}
  end

  def feed_cats
    Cat.all.map {|cat| cat.mood = "happy"}
  end

  def sell_pets
    Cat.all.map {|cat| 
    cat.mood = "nervous" 
    cat.owner = nil}
    Dog.all.map {|dog| 
    dog.mood = "nervous"
    dog.owner = nil}
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

  end