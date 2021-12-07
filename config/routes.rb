Rails.application.routes.draw do

  root "things#index"

  # Routes for the Thing resource:

  # CREATE
  post("/insert_thing", { :controller => "things", :action => "create" })
          
  # READ
  get("/things", { :controller => "things", :action => "index" })
  
  get("/things/:path_id", { :controller => "things", :action => "show" })
  
  # UPDATE
  
  post("/modify_thing/:path_id", { :controller => "things", :action => "update" })
  
  # DELETE
  get("/delete_thing/:path_id", { :controller => "things", :action => "destroy" })

  #------------------------------

  # Routes for the Tag resource:

  # CREATE
  post("/insert_tag", { :controller => "tags", :action => "create" })
          
  # READ
  get("/tags", { :controller => "tags", :action => "index" })
  
  get("/tags/:path_id", { :controller => "tags", :action => "show" })
  
  # UPDATE
  
  post("/modify_tag/:path_id", { :controller => "tags", :action => "update" })
  
  # DELETE
  get("/delete_tag/:path_id", { :controller => "tags", :action => "destroy" })

  #------------------------------

  # Routes for the Tagging resource:

  # CREATE
  post("/insert_tagging", { :controller => "taggings", :action => "create" })
          
  # READ
  get("/taggings", { :controller => "taggings", :action => "index" })
  
  get("/taggings/:path_id", { :controller => "taggings", :action => "show" })
  
  # UPDATE
  
  post("/modify_tagging/:path_id", { :controller => "taggings", :action => "update" })
  
  # DELETE
  get("/delete_tagging/:path_id", { :controller => "taggings", :action => "destroy" })

  #------------------------------

end
