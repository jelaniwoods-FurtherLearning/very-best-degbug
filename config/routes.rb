Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index" })
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:username", { :controller => "users", :action => "show" })
  get("/update_user/:the_id", { :controller => "users", :action => "update" })

  get("/venues", { :controller => "venues", :action => "index" })
  get("/insert_venue_record", { :controller => "venues", :action => "create" })
  get("/venues/:venue_id", { :controller => "venues", :action => "show" })
  get("/update_venue/:venue_id", { :controller => "venues", :action => "update" })
  get("/delete_venue/:venue_id", { :controller => "venues", :action => "destroy" })
  
  get("/insert_comment_record", { :controller => "comments", :action => "create" })
 
   # =================================================
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
