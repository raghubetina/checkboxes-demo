class ThingsController < ApplicationController
  def index
    matching_things = Thing.all

    @list_of_things = matching_things.order({ :created_at => :desc })

    render({ :template => "things/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_things = Thing.where({ :id => the_id })

    @the_thing = matching_things.at(0)

    render({ :template => "things/show.html.erb" })
  end

  def create
    the_thing = Thing.new
    the_thing.name = params.fetch("query_name")

    if the_thing.valid?
      the_thing.save

      checked_tags = params.fetch("tags")

      checked_tags.each do |a_tag_id|
        new_tagging = Tagging.new
        new_tagging.thing_id = the_thing.id
        new_tagging.tag_id = a_tag_id
        new_tagging.save
      end

      redirect_to("/things/#{the_thing.id}", { :notice => "Thing created successfully." })
    else
      redirect_to("/things", { :notice => "Thing failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_thing = Thing.where({ :id => the_id }).at(0)

    the_thing.name = params.fetch("query_name")

    if the_thing.valid?
      the_thing.save
      redirect_to("/things/#{the_thing.id}", { :notice => "Thing updated successfully."} )
    else
      redirect_to("/things/#{the_thing.id}", { :alert => "Thing failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_thing = Thing.where({ :id => the_id }).at(0)

    the_thing.destroy

    redirect_to("/things", { :notice => "Thing deleted successfully."} )
  end
end
