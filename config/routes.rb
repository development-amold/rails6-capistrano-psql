Rails.application.routes.draw do
  comfy_route :cms_admin, path: "/cms/admin"
  # Ensure that this route is defined last
  
  comfy_route :blog_admin, path: "/admin"
  comfy_route :blog, path: "/blog"
  resources :accounts
  resources :users
  resources :posts
  root "posts#index"
  comfy_route :cms, path: "/"  #----this should be mandatory to be hosted on root dont change this one and put this one in the last

end
