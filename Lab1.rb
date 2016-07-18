#Methods

def print_divider
  puts "*" * 40
  puts "\n"
end

def print_progress_bar
  3.times {sleep 0.5; print "."}
  puts "\n"
end

#ingredients
NUM_Picanhas = 4
NUM_Chicken_Wings = 32
NUM_Sausage = 12
NUM_Bread = 20
NUM_Beer = 60

ingredients = [
  {name: 'picanhas', quantity: NUM_Picanhas},
  {name: 'chicken wings', quantity: NUM_Chicken_Wings},
  {name: 'sausages', quantity: NUM_Sausage},
  {name: 'breads', quantity: NUM_Bread},
  {name: 'organic charcoal', quantity: 'lots of'},
  {name: 'skewers', quantity: 8},
  {name: 'beers', quantity: NUM_Beer},
  {name: 'caipirinhas', quantity: 'lots'},
]

#Invite to cook and list ingredients
puts "    Let's cook a Churrasco!    "
print_divider

puts "You need the following ingredients:"

ingredients.each do |ingredient|
  puts "*  #{ingredient[:quantity]} #{ingredient[:name]}"
end

#Assure everything is in place
loop do
  puts "\n"
  print_divider

  puts "Got all ingredients you need? (Y/N)"
  answer = gets.chomp
  answer = answer.upcase


  if answer == 'N'
    puts "You need to go shopping"
    print_progress_bar
  elsif answer == 'Y'
    puts "Let's start cooking!"
    break
  else
    puts "That's not a valid input. Try again."
  end
end

#Recipe steps
steps = [
  {description: "Set the fire", action: "fire"},
  {description: "Salt the meat", action: "salt_meat"},
  {description: "Season the chicken wings", action: "season_chicken"},
  {description: "Thread the Picanhas, Chicken Wings and Sausages onto skewers", action: "skewers_meat"},
  {description: "Put the skewers on the grill", action: "skewers_grill"},
  {description: "Cut the bread", action: "cut_bread"},
  {description: "Put the beers into ice bucket", action: "beer_ice"},
  {description: "Start drinking caipirinhas", action: "start_caipirinhas"},
  {description: "Check if it is time to turn the skewers", action: "turn_skewers"},
  #{description: "Serve the meat and the bread", action: "serve_churrasco"}
]

#Print steps

print_divider
puts "See below the different steps to follow:"

steps.each_with_index do |step, index|
  puts (index + 1).to_s + ") " + step[:description]
end

#Define Actions
def generic_recipe_step
  puts "On it!"
  print_progress_bar
end

def salt_meat
  counter = 0
  while counter < NUM_Picanhas
    counter += 1
    print "Salting Picanha #{counter}"
    print_progress_bar
  end
end

def season_chicken
  counter = 0
  while counter < NUM_Chicken_Wings
    counter += 8
    print "Seasoning Chicken Wings #{counter}"
    print_progress_bar
  end
end

def skewers_meat
  counter = 0
  while counter < NUM_Sausage
    counter += 4
    print "Thread the meat onto skewers"
    print_progress_bar
  end
end

def fire
  print "Set the charcoal on fire!!!"
  print_progress_bar
end

def skewers_grill
  print "Put the skewers on the grill"
  print_progress_bar
end

def cut_bread
  print "Cut the bread"
  print_progress_bar
end

def beer_ice
  print "Put the beer on ice buckets"
  print_progress_bar
end

def start_caipirinhas
  print "Start drinking your first caipirinha"
  print_progress_bar
end

def turn_skewers
  print "Check if the skwers should be turned around"
  print_progress_bar
end


def ask_if_ready (step, index)
  puts "Are you ready for step #{index + 1}?\n(#{step[:description]})"
  answer = gets.chomp

  answer.upcase == 'Y'
end

#Iterating
steps.each_with_index do |step, index|
  print_divider

  loop do
    ready = ask_if_ready(step, index)
    break if ready

    puts "OK, I will give you some extra time."
    print_progress_bar
  end

  send(step[:action])
  end

  #Done cooking
  print_divider
  puts "Está na mesa pessoaaalll!!! Enjoy your meal!"
