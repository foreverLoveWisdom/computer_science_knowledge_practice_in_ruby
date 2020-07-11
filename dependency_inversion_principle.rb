# The Dependency Inversion Principle (DIP) suggests that
# “High-level modules shouldn’t depend on low-level modules.
# Both modules should depend on abstractions. In addition,
# abstractions shouldn’t depend on details. Details depend on abstractions.”

# Interestingly, Martin doesn’t consider the DIP principle to be
# a completely separate principle, but claims that the DIP principle
# is simply the result of strictly following two other SOLID principles:
# Liskov substitution and open-closed. According to Martin, code that follows
# the LSP and OCP principles should be readable and contain clearly separated
# abstractions.
# It should also be extendable, and child classes should be easily replaceable
# by other instances of a base class without breaking the system.

# The following code violates the DIP
class Printer
  def initialize(data)
    @data = data
  end

  def print_pdf
    PdfFormatter.new.format(@data)
  end

  def print_html
    HtmlFormatter.new.format(@data)
  end
end

class PdfFormatter
  def format(data)
  end
end

class HtmlFormatter
  def format(data)
  end
end

printer = Printer.new
printer.print_html
# what if I want to add more formats like Excel, Word...
# It means that I gotta modify the Printer class