# Turn [[1,1,1,1],[2,2,2,2]] into [4,8]
initial_array = [[1,1,1,1],[2,2,2,2]]
new_array = initial_array.map {|arr| arr.reduce(:+)}
p "#{initial_array} ----> #{new_array}"

# Select the odd numbers from this array [1,2,3,4,5,6,7,8,9,10] => [1,3,5,7,9]
numbers = (1..10).to_a
odds = numbers.select {|number| number % 2 != 0}
p "All odd numbers from #{numbers} ---> #{odds}"

# Puts each name that starts with ‘S’ from [‘Sandy’, ‘Terrence’,‘Susan’, ‘Humphrey’, ‘Simone’, ‘Englebert’, ‘Imogen’, ‘Ron’]
names = ['Sandy', 'Terrence','Susan', 'Humphrey', 'Simone', 'Englebert', 'Imogen', 'Ron']
p names.grep(/^S/)

# Create a new array of these names in block caps [‘Sandy’, ‘Terrence’,‘Susan’, ‘Humphrey’, ‘Simone’, ‘Englebert’, ‘Imogen’, ‘Ron’]
p names.map(&:upcase)

# Get user input and add whatever they say to an array, stop when they say ‘stop’ -> combining loops and arrays
def register(arr = [])
    print "Enter a name to the register: "
    name = gets.chomp
    if name.downcase == 'stop'
        puts "Register: " << arr.to_s # arr.join('') is also an option
        return
    else
        return register( arr << name )
    end
end

register
