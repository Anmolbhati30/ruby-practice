class String
    def is_integer?
      self.to_i.to_s == self
    end
  end

def fizzbuzz
    print "Enter a number, any number!: "
    num = gets.chomp
    
    if num.is_integer?
        num = num.to_i
    else
        puts "Please enter a number!"
        fizzbuzz
    end

    if num % 3 == 0
        if num % 5 == 0
            puts "FizzBuzz"
        else
            puts "Fizz"
        end
    elsif num % 5 == 0
        puts "Buzz"
    else
        puts num
    end

    return
end

fizzbuzz


