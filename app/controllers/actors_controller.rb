class ActorsController < ApplicationController
  def index
    @list_of_actors = Actor.all
    render({ :template => "actors_template/index.html.erb" })
  end

  def actor_details
    @id = params.fetch("id").to_i
    @the_actor = Actor.where({ :id => @id })[0]
    @filmography = get_filmography(@id)
    render({ :template => "actors_template/show.html.erb" })
  end

  def get_filmography(actor_id)
    characters = Character.where({ :actor_id => actor_id })

    filmography = Array.new

    characters.each do |chr|
      movie = Movie.where({ :id => chr.movie_id })[0]
      dir_name = Director.where({ :id => movie.director_id })[0].name
      film = {
        "title" => movie.title,
        "year" => movie.year,
        "director" => dir_name,
        "character_name" => chr.name,
        "movie_id" => movie.id,
      }
      filmography.push(film)
    end
    return filmography
  end
end
