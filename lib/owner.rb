class Owner
  attr_reader :name ,:species
  @@all=[]
  def initialize(name)
    @name=name
    @species="human"
    @@all<<self
  end
  def say_species
    "I am a #{self.species}."
  end
  def self.all
    @@all
  end
  def self.count
    self.all.count
  end
  def self.reset_all
    self.all.clear
  end
  def cats
    Cat.all.select{|cats| cats.owner==self}
  end
  def dogs
    Dog.all.select{|dogs| dogs.owner==self}
  end
  def buy_cat(name)
    cat=Cat.new(name,self)
  end
  def buy_dog(name)
    dog=Dog.new(name,self)
  end
  def walk_dogs
    self.dogs.each{|dogs|dogs.mood="happy"}
  end
  def feed_cats
    self.cats.each{|cats|cats.mood="happy"}
  end
  def sell_pets
    self.dogs.each{|dogs|dogs.mood="nervous" 
      dogs.owner=nil }
    self.cats.each{|cats|cats.mood="nervous" 
        cats.owner=nil }
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
  
end