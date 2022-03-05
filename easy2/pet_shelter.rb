=begin
Write the classes and methods that will be necessary to make this code run, and 
print the following output:

P Hanson has adopted the following pets:
a cat named Butterscotch
a cat named Pudding
a bearded dragon named Darwin

B Holmes has adopted the following pets:
a dog named Molly
a parakeet named Sweetie Pie
a dog named Kennedy
a fish named Chester

P Hanson has 3 adopted pets.
B Holmes has 4 adopted pets.

The order of the output does not matter, so long as all of the information is 
presented.
=end

class Pet
  attr_reader :pet_type, :name

  def initialize(pet_type, name)
    @pet_type = pet_type
    @name = name
  end

  def to_s
    "a #{pet_type} named #{name}"
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def add_pet(pet)
    pets << pet
  end

  def number_of_pets
    pets.size
  end

  def print_pets
    puts pets
  end
end

class Shelter
  def initialize
    @adoptions = Hash.new([])
    @unadopted_pets = []
  end

  def add_pet(pet)
    unadopted_pets << pet
  end
  
  def adopt(owner, pet)
    owner.add_pet(pet)
    adoptions[owner] += [pet]
  end

  def print_unadopted_pets
    puts "The Animal Shelter has the following unadopted pets:"
    unadopted_pets.each do |pet|
      puts pet
    end
    puts
  end

  def print_adoptions
    adoptions.each do |owner, pets|
      puts "#{owner.name} has adopted the following pets:"
      owner.print_pets
      # pets.each do |pet|
      #   puts pet
      # end
      puts
    end
  end

  private

  attr_reader :adoptions, :unadopted_pets
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
rolly        = Pet.new('dog', 'Rolly')
pongo        = Pet.new('dog', 'Pongo')
perdita      = Pet.new('dog', 'Perdita')
socks        = Pet.new('cat', 'Socks')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')
jwang   = Owner.new('J Wang')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.adopt(jwang, rolly)
shelter.adopt(jwang, socks)
shelter.add_pet(pongo)
shelter.add_pet(perdita)
shelter.print_unadopted_pets
shelter.print_adoptions

puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "#{jwang.name} has #{jwang.number_of_pets} adopted pets."