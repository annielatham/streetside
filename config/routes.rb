Rails.application.routes.draw do
  # Routes for the Vehicle resource:
  # CREATE
  get "/vehicles/new", :controller => "vehicles", :action => "new"
  post "/create_vehicle", :controller => "vehicles", :action => "create"

  # READ
  get "/vehicles", :controller => "vehicles", :action => "index"
  get "/vehicles/:id", :controller => "vehicles", :action => "show"

  # UPDATE
  get "/vehicles/:id/edit", :controller => "vehicles", :action => "edit"
  post "/update_vehicle/:id", :controller => "vehicles", :action => "update"

  # DELETE
  get "/delete_vehicle/:id", :controller => "vehicles", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
