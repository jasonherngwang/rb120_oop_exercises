=begin
Stack Machine Interpretation
Write a class that implements a miniature stack-and-register-based programming language that has the following commands:

n Place a value n in the "register". Do not modify the stack.
PUSH  Push the register value on to the stack. Leave the value in the register.
ADD   Pops a value from the stack and adds it to the register value, storing the result in the register.
SUB   Pops a value from the stack and subtracts it from the register value, storing the result in the register.
MULT  Pops a value from the stack and multiplies it by the register value, storing the result in the register.
DIV   Pops a value from the stack and divides it into the register value, storing the integer result in the register.
MOD   Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
POP   Remove the topmost item from the stack and place in register
PRINT Print the register value

All operations are integer operations (which is only important with DIV and MOD).

Nouns and Verbs
---------------------------
Minilang
- Perform operation with register and/or top element of stock
Register
- Place value in register
- Print current value
Stack
- Push element
- Pop element
Command

CRC Cards
----------------------------
Class: Minilang
Responsibilities
- Accept a String of commands.
- Execute the commands.
- Determing whether each command is:
  - A value (Integer)
  - A valid command (String)
  - Invalid input
- Raise exception if invalid input encoutered
- Place value in Register
- Interpret and execute commands
Collaborators
- Has a Stack
- Has a Register
- Has Commands

Class: Stack
Responsibilities
- Push value onto stack
- Pop value from stack
Collaborators
- Has an Array of values
- Stored in the state of Machine

Class: Command
Responsibilities
- Contain a Symbol representing a method.
Collaborators
- Stored in the state of Machine
=end
# Spike

# Define class to raise an exception

class Minilang
  def initialize(command_str)
    # Initialize stack, register, commands array
  end

  def convert_commands(command_str)
    # Split command string into individual commands.
    # Create Command objects and store in Array.
    # Check command validity; raise exception if invalid command found.
  end

  def execute_commands(commands)
    # Iterate through and execute commands
  end

  def eval
    convert_commands
    execute_commands
  end

  private
  # Getter/setter for register
end

class Stack
  def push
    # Push value onto stack.
  end

  def pop
    # Pop value off of stack.
  end
end

class Command
  def initialize(method_symbol)
    # Initialize method
  end

  def execute(register, stack)
  end
end



