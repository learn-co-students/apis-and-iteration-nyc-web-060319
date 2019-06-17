require 'rest-client'
require 'json'
require 'pry'

def movies(character_hash)
  if character_hash == nil
    raise StandardError.new "Character not found!"
  end
  film_array = character_hash["films"]
  responses = film_array.map do |film|
    JSON.parse(RestClient.get(film))
  end.map do |resp|
    resp["title"]
  end
  responses
end

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  character = response_hash["results"].find{ |film| film["name"].downcase.include?(character_name)}
  movies(character)
end

def print_movies(films)
  films.each do |resp|
    puts "\t #{resp}"
  end
end

def show_character_movies(character)
  begin
    films = get_character_movies_from_api(character)
    print_movies(films)
  rescue StandardError => e
    puts "Character not found! #{e.inspect}"
    puts "Try again."
    show_character_movies(get_character_from_user)
  end
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
