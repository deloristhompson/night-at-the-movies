# your code, here

require 'time'
class Movies
  attr_accessor :movie_name, :movie_genre, :movie_time

  def initialize(movie)
    @movie_name = movie[:movie_name]
    @movie_genre = movie[:movie_genre]
    @movie_time = Time.parse(movie[:movie_time].strip)
  end

  def showing_after?(arrival_time)
    @movie_time >= Time.parse(arrival_time)
  end

  def showing_between?(early, late)
    @movie_time.between?(Time.parse(early), Time.parse(late))
  end

  def comedy?
    'Comedy'.include?(@movie_genre)
  end

  def list_of_movies
    "#{@movie_name} is a #{movie_genre} showing at #{@movie_time.strftime("%l:%M %p")}\n"
  end
end

movies_showing =  [
{movie_name: 'The Princess Bride', movie_genre: 'Comedy', movie_time: '7:00PM'},
{movie_name: 'Troll 2', movie_genre: 'Horror', movie_time: '7:30PM'},
{movie_name: 'Pet Cemetery', movie_genre: 'Horror', movie_time: '8:15PM'},
{movie_name: 'Flight of the Navigator', movie_genre: 'Adventure', movie_time: '8:17PM'},
{movie_name: 'Teen Witch', movie_genre: 'Comedy', movie_time: '8:20PM'},
{movie_name: 'The Goonies', movie_genre: 'Comedy', movie_time: '8:30PM'},
{movie_name: 'Better Off Dead', movie_genre: 'Comedy', movie_time: '8:45PM'},
{movie_name: 'Weekend at Bernies', movie_genre: 'Comedy', movie_time: '9:00PM'},
{movie_name: 'The Wizard', movie_genre: 'Adventure', movie_time: '9:10PM'}
]
showings = []
movies_showing.each do |movie_hash|
  showings << Movies.new(movie_hash)
end

 showings.each do |moving|
   puts moving.list_of_movies
 end
 comedys = []
 puts "\nGenre: Comedy\n----------------"
 showings.each do |movie_comedy|
  if movie_comedy.comedy?
    puts movie_comedy.list_of_movies
    comedys << movie_comedy
  end
end

time = '8:15pm'
time_2 = '9:45pm'
puts
puts "The following movies are showing after #{time}:
----------------------------------------------"

showings.each do |arrival_time|
  if arrival_time.showing_after?(time)
    puts arrival_time.list_of_movies
  end
end

 puts
 puts "The following movies are showing between #{time}-#{time_2}:
 ------------------------------------------------------"
 
showings.each do |arrival|
  if arrival.showing_between?(time, time_2)
    puts arrival.list_of_movies
  end
end
