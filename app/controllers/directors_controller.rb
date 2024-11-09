class DirectorsController < ApplicationController
  def index
    render({:template=>"director_templates/list"})
  end
  def show
    the_id=params.fetch("the_id")
    matching_records=Director.where({:id=>the_id})
    @the_director=matching_records.at(0)
    render({:template=>"director_templates/details"})
  end
  def youngest
    desc_directors=Director.all.order({:dob=>:desc}).where.not({:dob=>nil})
    @youngest_director=desc_directors.at(0)

    render({:template=>"director_templates/youngest"})
  end
  def eldest
    desc_directors=Director.all.order({:dob=>:desc}).where.not({:dob=>nil})
    @eldest_director=desc_directors.at(-1)

    render({:template=>"director_templates/eldest"})
  end

end
