require 'pry'

class Movie
  attr_accessor :title, :release_date, :director, :summary

  @@movies = []

  def initialize(title, release_date, director, summary)
    @title = title
    @release_date = release_date
    @director = director
    @summary = summary
    @@movies << self
    self
  end

  def self.all
    @@movies
  end

  def self.reset_movies!
    @@movies = []
  end

  def self.make_movies!
    File.readlines("spec/fixtures/movies.txt").each do |line|
      #binding.pry()
      movie = line.split(' - ')
      Movie.new(movie[0], movie[1].to_i, movie[2], movie[3])
    end
  end

  def self.recent
    recent = []
    @@movies.each do |movie|
      if movie.release_date >= 2012
        recent << movie
      end
    end
    recent
  end

  def url
    "#{title.gsub(' ', '_').gsub(/[']/, '').downcase}.html"
  end
end