class TagsController < ApplicationController
  def index
    matching_tags = Tag.all

    @list_of_tags = matching_tags.order({ :created_at => :desc })

    render({ :template => "tags/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_tags = Tag.where({ :id => the_id })

    @the_tag = matching_tags.at(0)

    render({ :template => "tags/show.html.erb" })
  end

  def create
    the_tag = Tag.new
    the_tag.name = params.fetch("query_name")

    if the_tag.valid?
      the_tag.save
      redirect_to("/tags", { :notice => "Tag created successfully." })
    else
      redirect_to("/tags", { :notice => "Tag failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_tag = Tag.where({ :id => the_id }).at(0)

    the_tag.name = params.fetch("query_name")

    if the_tag.valid?
      the_tag.save
      redirect_to("/tags/#{the_tag.id}", { :notice => "Tag updated successfully."} )
    else
      redirect_to("/tags/#{the_tag.id}", { :alert => "Tag failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_tag = Tag.where({ :id => the_id }).at(0)

    the_tag.destroy

    redirect_to("/tags", { :notice => "Tag deleted successfully."} )
  end
end
