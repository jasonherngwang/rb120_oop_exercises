class MinilangError < StandardError; end
class EmptyStackError < MinilangError; end
class InvalidTokenError < MinilangError; end

class Minilang
  VALID_COMMANDS = %w(ADD SUB MULT DIV MOD POP PUSH PRINT)

  def initialize(program)
    @stack = Stack.new
    @register = 0
    @program = program
  end

  def eval(params = {})
    new_program = format(program, params)
    new_program.split.each { |token| eval_token(token) }
  rescue MinilangError => error
    puts error.message
  end

  private

  def eval_token(token)
    if VALID_COMMANDS.include?(token)
      send(token.downcase)
    elsif token =~ /\A[-+]?\d+\z/
      self.register = token.to_i
    else
      raise InvalidTokenError, "Invalid token: #{token}"
    end
  end

  def add
    self.register += stack.pop
  end

  def sub
    self.register -= stack.pop
  end

  def mult
    self.register *= stack.pop
  end

  def div
    self.register /= stack.pop
  end

  def mod
    self.register %= stack.pop
  end

  def pop
    self.register = stack.pop
  end

  def push
    stack.push(register)
  end

  def print
    puts register
  end

  attr_accessor :stack, :register, :program
end

class Stack < Array
  def initialize
    @stack = []
  end

  def push(element)
    @stack.push(element)
  end

  def pop
    raise EmptyStackError if @stack.empty?
    @stack.pop
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)


CENTIGRADE_TO_FAHRENHEIT =
  '5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'
Minilang.new(format(CENTIGRADE_TO_FAHRENHEIT, degrees_c: 100)).eval
# 212
Minilang.new(format(CENTIGRADE_TO_FAHRENHEIT, degrees_c: 0)).eval
# 32
Minilang.new(format(CENTIGRADE_TO_FAHRENHEIT, degrees_c: -40)).eval
# -40

# CENTIGRADE_TO_FAHRENHEIT =
#   '5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'
minilang = Minilang.new(CENTIGRADE_TO_FAHRENHEIT)
minilang.eval(degrees_c: 100)
# 212
minilang.eval(degrees_c: 0)
# 32
minilang.eval(degrees_c: -40)
# -40

FAHRENHEIT_TO_CENTIGRADE =
  '9 PUSH 5 PUSH 32 PUSH %<degrees_f>d SUB MULT DIV PRINT'
Minilang.new(format(FAHRENHEIT_TO_CENTIGRADE, degrees_f: 212)).eval
# 100
Minilang.new(format(FAHRENHEIT_TO_CENTIGRADE, degrees_f: 32)).eval
# 0
Minilang.new(format(FAHRENHEIT_TO_CENTIGRADE, degrees_f: -40)).eval
# -40

RECTANGLE_AREA = 
  '%<length>d PUSH %<width>d MULT PRINT'
Minilang.new(format(RECTANGLE_AREA, length: 20, width: 10)).eval
# 200