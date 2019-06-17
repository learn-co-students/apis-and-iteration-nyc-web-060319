def welcome
  #from https://www.asciimation.co.nz/#
  str =<<-s
  8888888888  888    88888
  88     88   88 88   88  88
   8888  88  88   88  88888
      88 88 888888888 88   88
88888888  88 88     88 88    888888

88  88  88   888    88888    888888
88  88  88  88 88   88  88  88
88 8888 88 88   88  88888    8888
888  888 888888888 88   88     88
 88  88  88     88 88    8888888
  s
  puts str
end

def get_character_from_user
  puts "please enter a character name"
  name = gets.chomp
  # use gets to capture the user's input. This method should return that input, downcased.
  name.downcase!
  name
end
