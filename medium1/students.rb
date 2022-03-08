=begin
Below we have 3 classes: Student, Graduate, and Undergraduate. The 
implementation details for the #initialize methods in Graduate and 
Undergraduate are missing. Fill in those missing details so that the following 
requirements are fulfilled:

Graduate students have the option to use on-campus parking, while Undergraduate 
students do not.

Graduate and Undergraduate students both have a name and year associated with 
them.

Note, you can do this by adding or altering no more than 5 lines of code.
=end

class StudentBody
  @@number_of_students = 0
  
  def initialize
    @@number_of_students += 1
    @student_id = @@number_of_students
  end

  def self.total_students
    @@number_of_students
  end
end

class Student < StudentBody
  def initialize(name, year)
    @name = name
    @year = year
    super()
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student
end

p StudentBody.total_students
jason = Graduate.new('Jason', 2022, 'yes')
p jason
p StudentBody.total_students