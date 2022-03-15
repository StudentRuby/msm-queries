# app/models/director.rb
class Director < ApplicationRecord
  def index
    @list_of_directors = Director.all
    render({ :template => "director_templates/index.html.erb" })
  end
end
