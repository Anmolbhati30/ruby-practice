class RomanNumerals
  @@ROMAN_NUMBERS = {
    1000 => "M",  
     900 => "CM",  
     500 => "D",  
     400 => "CD",
     100 => "C",  
      90 => "XC",  
      50 => "L",  
      40 => "XL",  
      10 => "X",  
        9 => "IX",  
        5 => "V",  
        4 => "IV",  
        1 => "I",  
  }

  # class << self
  def RomanNumerals.to_roman(number)
    roman_string = ''

    @@ROMAN_NUMBERS.each{ |value, roman_symbol|
      amount_of_symbol = number / value
      
      roman_string <<= roman_symbol * (amount_of_symbol)

      number = number.remainder(value)
    }

    roman_string
  end


  def RomanNumerals.from_roman(roman)
    number = 0

    @@ROMAN_NUMBERS.each{ |value, roman_symbol| 
      while roman.match?("^(#{roman_symbol})")
        number += value
        
        roman = roman.sub(roman_symbol, '')
      end
    }
    
    number
  end
  # end

  def self.god_talks
    puts "hi im the roman god"
  end

  def talk_to_god
    RomanNumerals.god_talks
  end

  def ask_the_gods(number_to_consider)
    if number_to_consider.is_a?(Integer)  
      RomanNumerals.to_roman(number_to_consider) 
    else
      RomanNumerals.from_roman(number_to_consider)
    end
  end
end

=begin
I can be placed before V (5) and X (10) to make 4 and 9.
X can be placed before L (50) and C (100) to make 40 and 90.
C can be placed before D (500) and M (1000) to make 400 and 900.  
=end

