class Calculator
  def add(num1, num2)
    num1 + num2
  end
  
  alias_method "plus", "add"
  alias_method "+", "add"

  def subtract(num1, num2)
    num1 - num2
  end

  alias_method "minus", "subtract"
  alias_method "-", "subtract" 

  def multiply(num1, num2)
    num1 * num2
  end

  alias_method "times", "multiply"
  alias_method "x", "multiply"

  def divide(num1, num2)
    quotient = num1.to_f / num2
    quotient.to_i == quotient ? quotient.to_i : quotient
  end

  alias_method "over", "divide"
  alias_method "/", "divide"

end

def run
  nerd = Calculator.new

  print "I'll solve anything! Gimme an equation: " 
  
  while true
    equation = gets.chomp
    
    if equation == "no"
      puts "uhm ok"
    end
    
    parts = equation.split
    left_number = parts[0].to_i
    right_number = parts[2].to_i
    operand = parts[1]

    puts "Easy that's #{nerd.public_send(operand,left_number, right_number)}"
    print "Another one: "
  end
end

run