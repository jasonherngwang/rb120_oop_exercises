=begin
There is nothing technically incorrect about this class, but the definition may 
lead to problems in the future. How can this class be fixed to be resistant to 
future problems?

attr_accessor should be made private because database_handle is never accessed 
or modified from outside the class. Database interactions should not be 
exposed.

If users become depending on accessing database_handle, it will be more 
difficult to remove the database without disrupting users.
=end


class Flight
  attr_accessor :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end