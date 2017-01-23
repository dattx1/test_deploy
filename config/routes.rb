Rails.application.routes.draw do
  get "device_code/show"
  get "get_device_code/show"
  get "assignment_device/show"
  get "group_category/show"
  get "device_assign/show"
  get "requests/new"
  get "assignments/render_category_by_group"
  get "assignments/render_device_can_assign"
  get "assignments/add_new_assignment_device"
  get "devices/get_device_code"
  root   "static_pages#home"
  get    "/home",    to: "static_pages#home"
  get    "/about",   to: "static_pages#about"
  get    "/help",    to: "static_pages#help"
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  resources :users
  resources :devices
  resources :requests
  resources :assignments
end
