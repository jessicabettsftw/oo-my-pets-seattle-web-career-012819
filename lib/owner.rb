class Owner
  # code goes here
  attr_reader :species
  attr_accessor :name, :pets

  @@all = []
  def initialize(species)
    @species = species
    @pets = {:fishes => [], :dogs => [], :cats => []}

    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    self.all.clear
    self.count
  end

  def list_pets
    num_types = (@pets.keys).length
    index = 1
    message = "I have "
    @pets.each do |pet_type, pets|
      message << "#{pets.length} "
      if pet_type == :fishes
        message << "fish"
      elsif pet_type == :dogs
        message << "dog(s)"
      elsif pet_type == :cats
        message << "cat(s)"
      end

      if index < (num_types)
        message << ", "
        if index == (num_types - 1)
          message << "and "
        end
      else
        message << "."
      end
      index += 1
    end
    message
  end

  def sell_pets
    @pets.each do |pet_type, pets|
      pets.each do |pet|
        pet.mood = "nervous"
      end
      @pets[pet_type].clear
    end
    @pets
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog
  end

  def walk_dogs()
    @pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats()
    @pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish()
    @pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end
end
