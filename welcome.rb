def greet
  print "Hello, what's your name? "
  name = gets.chomp

  puts "Great to meet you, #{name}!"
end

def talk_about_weather
  weather_comments = [
    "God it's pouring out there!",
    "Ah we got a bit of sun, won't stick around "\
    "long in England though!",
    "Cloudy again? Probably going to rain soon..."
  ]

  puts weather_comments[rand(3)]
end

def tell_the_time
  puts "The time is #{Time.now.strftime("%H:%M")}"
end

def welcome
  greet
  talk_about_weather
  tell_the_time
end

welcome