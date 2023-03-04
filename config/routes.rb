Rails.application.routes.draw do



  # Routes for the Score resource:

  # CREATE
  post("/insert_score", { :controller => "scores", :action => "create" })
          
  # READ
  get("/scores", { :controller => "scores", :action => "index" })
  
  get("/scores/:path_id", { :controller => "scores", :action => "show" })
  
  # UPDATE
  
  post("/modify_score/:path_id", { :controller => "scores", :action => "update" })
  
  # DELETE
  get("/delete_score/:path_id", { :controller => "scores", :action => "destroy" })

  #------------------------------

  # Routes for the Option resource:

  # CREATE
  post("/insert_option", { :controller => "options", :action => "create" })
          
  # READ
  get("/options", { :controller => "options", :action => "index" })
  
  get("/options/:path_id", { :controller => "options", :action => "show" })
  
  # UPDATE
  
  post("/modify_option/:path_id", { :controller => "options", :action => "update" })
  
  # DELETE
  get("/delete_option/:path_id", { :controller => "options", :action => "destroy" })

  #------------------------------

  # Routes for the Decision resource:

  # CREATE
  post("/insert_decision", { :controller => "decisions", :action => "create" })
          
  # READ
  get("/decisions", { :controller => "decisions", :action => "index" })
  
  get("/decisions/:path_id", { :controller => "decisions", :action => "options" })

  get("/decisions_criteria/:path_id", { :controller => "decisions", :action => "show" })

  get("/decisions_weights/:path_id", { :controller => "decisions", :action => "weights" })
  
  # UPDATE
  
  post("/modify_decision/:path_id", { :controller => "decisions", :action => "update" })
  
  # DELETE
  get("/delete_decision/:path_id", { :controller => "decisions", :action => "destroy" })

  #------------------------------

  # Routes for the Criterium resource:

  # CREATE
  post("/insert_criterium", { :controller => "criteria", :action => "create" })
          
  # READ
  get("/criteria", { :controller => "criteria", :action => "index" })
  
  get("/criteria/:path_id", { :controller => "criteria", :action => "show" })
  
  # UPDATE
  
  post("/modify_criterium/:path_id", { :controller => "criteria", :action => "update" })
  
  # DELETE
  get("/delete_criterium/:path_id", { :controller => "criteria", :action => "destroy" })

  #------------------------------

end
