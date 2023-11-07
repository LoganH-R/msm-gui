class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def insert
    new_movie_title = params.fetch("query_title")
    new_movie_year = params.fetch("query_year")
    new_movie_duration = params.fetch("query_duration")
    new_movie_description = params.fetch("query_description")
    new_movie_image = params.fetch("query_image")
    new_director_id = params.fetch("query_director_id")

    
  end
end
