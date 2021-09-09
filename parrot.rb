def parrot
    input = gets.chomp
    
    while input != "STOP"
        puts input
        input = gets.chomp
    end
    
    return
end

parrot
