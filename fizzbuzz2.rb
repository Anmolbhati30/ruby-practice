class Empty
end

n = ""
num = Object.new

until n.upcase == "STOP"
  begin
    if num % 15 == 0
      puts "FizzBuzz"
    elsif num % 3 == 0
      puts "Fizz"
    elsif num % 5 == 0
      puts "Buzz"
    else
      puts "#{num} is not divisible by 5 or 3."
    end
  rescue NameError || NoMethodError
    num = 0
  end
  print "Insert an integer please: "
  n = gets.chomp 
  num = n.to_i 
end
