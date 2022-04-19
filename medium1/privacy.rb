# Modify this class so both flip_switch and the setter method switch= are private methods.

class Machine
  def initialize
    @switch = :off
  end

  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def condition
    "Switch is #{switch}."
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

gizmo = Machine.new
# p gizmo
p gizmo.condition
gizmo.start
# p gizmo
p gizmo.condition
gizmo.stop
# p gizmo
p gizmo.condition