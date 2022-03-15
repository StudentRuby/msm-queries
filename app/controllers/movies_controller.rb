class MoviesController < ApplicationController
  def index
    @list_of_movies = Movie.all
    render({ :template => "movies_template/index.html.erb" })
  end

  def movie_details
    @id = params.fetch("id").to_i
    @the_movie = Movie.where({ :id => @id })[0]
    @director = get_dir(@the_movie.director_id)
    render({ :template => "movies_template/show.html.erb" })
  end

  def get_dir(dir_id)
    director = Director.where({ :id => dir_id })[0]
    return director
  end
end
