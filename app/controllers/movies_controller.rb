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
    x = Movie.new
    x.title = params.fetch("query_title")
    x.year = params.fetch("query_year")
    x.duration = params.fetch("query_duration")
    x.description = params.fetch("query_description")
    x.image = params.fetch("query_image")
    x.director_id = params.fetch("query_director_id")

    x.save

    redirect_to("/movies")
  end

  def destroy
    the_id = params.fetch("an_id")

    matching_records = Movie.where({ :id => the_id })

    the_movie = matching_records.at(0)

    the_movie.destroy

    redirect_to("/movies")
  end

  def update
    m_id = params.fetch("the_id")

    matching_records = Movie.where({ :id => m_id })
    the_movie = matching_records.at(0) 

    the_movie.title = params.fetch("query_title")
    the_movie.year = params.fetch("query_year")
    the_movie.duration = params.fetch("query_duration")
    the_movie.description = params.fetch("query_description")
    the_movie.image = params.fetch("query_image")
    the_movie.director_id = params.fetch("query_director_id")

    the_movie.save

    redirect_to("/movies/#{the_movie.id}")
  end
end
