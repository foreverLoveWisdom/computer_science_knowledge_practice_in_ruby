# Simply put, main classes should be segregated into smaller specific classes,
# so their clients use only methods they need.
#   => Clients shouldn't depend on methods they don't use
#   => Avoid FAT classes
class CoffeeMachineInterface
  def select_drink_type
  end

  def select_portion
  end

  def select_sugar_amount
  end

  def brew_coffee
  end

  def clean_coffee_machine
  end

  def fill_coffee_beans
  end

  def fill_water_supply
  end

  def fill_sugar_supply
  end
end

# Here, the Person class only uses “select_drink_type“, “select_portion“,
#    “select_sugar_amount“, and “brew_coffee“ methods
#   => Violates ISP, a class should contains only methods that it needs.
class Person
  def initialize
    @coffee_machine = CoffeeMachineInterface.new
  end

  def make_coffee
    @coffee_machine.select_drink_type
    @coffee_machine.select_portion
    @coffee_machine.select_sugar_amount
    @coffee_machine.brew_coffee
  end
end

class Staff
  def initialize
    @coffee_machine = CoffeeMachineInterface.new
  end

  def serv
    @coffee_machine.clean_coffee_machine
    @coffee_machine.fill_coffee_beans
    @coffee_machine.fill_water_supply
    @coffee_machine.fill_sugar_supply
  end
end

teo = Person.new
teo.make_coffee
chuot = Staff.new
chuot.serv
# With this design segregated in two interfaces, we’ve avoided unused methods and
# now have two smaller interfaces with methods that perform specific tasks:

class CoffeeMachineUserInterface
  def select_drink_type
  end

  def select_portion
  end

  def select_sugar_amount
  end

  def brew_coffee
  end
end

class CoffeeMachineServiceInterface
  def clean_coffee_machine
  end

  def fill_coffee_beans
  end

  def fill_water_supply
  end

  def fill_sugar_supply
  end
end

class Person
  def initialize
    @coffee_machine = CoffeeMachineUserInterface.new
  end

  def make_coffee
    @coffee_machine.select_drink_type
    @coffee_machine.select_portion
    @coffee_machine.select_sugar_amount
    @coffee_machine.brew_coffee
  end
end

class Staff
  def initialize
    @coffee_machine = CoffeeMachineServiceInterface.new
  end

  def serv
    @coffee_machine.clean_coffee_machine
    @coffee_machine.fill_coffee_beans
    @coffee_machine.fill_water_supply
    @coffee_machine.fill_sugar_supply
  end
end
