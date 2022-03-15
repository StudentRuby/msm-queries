class DirectorsController < ApplicationController
  def index
    @list_of_directors = Director.all
    render({ :template => "directors_template/index.html.erb" })
  end

  def oldest
    @age = "eldest"
    @director = Director.where.not({ :dob => nil }).order({ :dob => :asc }).first
    render({ :template => "directors_template/age.html.erb" })
  end

  def youngest
    @age = "youngest"
    @director = Director.where.not({ :dob => nil }).order({ :dob => :desc }).first
    render({ :template => "directors_template/age.html.erb" })
  end

  def director_details
    @id = params.fetch("id").to_i
    @the_director = Director.where({ :id => @id })[0]
    @dir_movies = get_dir_movies(@id)
    render({ :template => "directors_template/show.html.erb" })
  end

  def get_dir_movies(dir_id)
    movies = Movie.where({ :director_id => dir_id }).order({ :created_at => :asc })
    return movies
  end
end
