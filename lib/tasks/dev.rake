desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do
  5.times do |i|
    Tag.create name: "Tag ##{i}"
  end

  tags = Tag.all

  5.times do |i|
    thing = Thing.create name: "Thing ##{i}"

    tags.sample(rand(5)).each do |tag|
      Tagging.create thing: thing, tag: tag
    end
    
  end


end
