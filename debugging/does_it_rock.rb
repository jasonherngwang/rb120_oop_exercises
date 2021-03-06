=begin
In order to test the case when authentication fails, we can simply set API_KEY 
to any string other than the correct key. Now, when using a wrong API key, we 
want our mock search engine to raise an AuthenticationError, and we want the 
find_out method to catch this error and print its error message API key is 
not valid.

Is this what you expect to happen given the code?

The code should output "No idea about...""

And why do we always get the following output instead?
  
  Sushi rocks!
  Rain rocks!
  Bug hunting rocks!

If an invalid API_KEY is used, an AuthenticationError is be raised, and 
the rescue expression in Score will return the class NoScore, instead of an 
instance of NoScore. In the case statement, the === method is used to check if 
the class NoScore is an instance of the class NoScore, which returns false. 
Therefore the else conditional branch is entered, printing "...rocks!"

To fix this, instantiate a NoScore object in the rescue expression of Score:
NoScore.new

Also switch Exception to StandardError as it is bad practice to catch all 
exceptions.
=end

class AuthenticationError < StandardError; end

# A mock search engine
# that returns a random number instead of an actual count.
class SearchEngine
  def self.count(query, api_key)
    unless valid?(api_key)
      raise AuthenticationError, 'API key is not valid.'
    end

    rand(200_000)
  end

  private

  def self.valid?(key)
    key == 'LS1A'
  end
end

module DoesItRock
  API_KEY = 'LS1A2'

  class NoScore; end

  class Score
    def self.for_term(term)
      positive = SearchEngine.count(%{"#{term} rocks"}, API_KEY).to_f
      negative = SearchEngine.count(%{"#{term} is not fun"}, API_KEY).to_f

      positive / (positive + negative)
    rescue ZeroDivisionError
      NoScore.new
    end
  end

  def self.find_out(term)
    score = Score.for_term(term)

    case score
    when NoScore
      "No idea about #{term}..."
    when 0...0.5
      "#{term} is not fun."
    when 0.5
      "#{term} seems to be ok..."
    else
      "#{term} rocks!"
    end
  rescue StandardError => e
    e.message
  end
end

# Example (your output may differ)

puts DoesItRock.find_out('Sushi')       # Sushi seems to be ok...
puts DoesItRock.find_out('Rain')        # Rain is not fun.
puts DoesItRock.find_out('Bug hunting') # Bug hunting rocks!