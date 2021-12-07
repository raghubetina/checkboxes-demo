class TaggingsController < ApplicationController
  def index
    matching_taggings = Tagging.all

    @list_of_taggings = matching_taggings.order({ :created_at => :desc })

    render({ :template => "taggings/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_taggings = Tagging.where({ :id => the_id })

    @the_tagging = matching_taggings.at(0)

    render({ :template => "taggings/show.html.erb" })
  end

  def create
    the_tagging = Tagging.new
    the_tagging.thing_id = params.fetch("query_thing_id")
    the_tagging.tag_id = params.fetch("query_tag_id")

    if the_tagging.valid?
      the_tagging.save
      redirect_to("/taggings", { :notice => "Tagging created successfully." })
    else
      redirect_to("/taggings", { :notice => "Tagging failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_tagging = Tagging.where({ :id => the_id }).at(0)

    the_tagging.thing_id = params.fetch("query_thing_id")
    the_tagging.tag_id = params.fetch("query_tag_id")

    if the_tagging.valid?
      the_tagging.save
      redirect_to("/taggings/#{the_tagging.id}", { :notice => "Tagging updated successfully."} )
    else
      redirect_to("/taggings/#{the_tagging.id}", { :alert => "Tagging failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_tagging = Tagging.where({ :id => the_id }).at(0)

    the_tagging.destroy

    redirect_to("/taggings", { :notice => "Tagging deleted successfully."} )
  end
end
