SocialNetwork::Application.routes.draw do
  
  get "openid_session/new"
  match '/OpenIdLogin',    to: 'openid_session#new'

  get "openid_session/create"
  get "openid_session/problem"  

  #get "sessions/new"
  #get "sessions/create"
  #get "sessions/failure"

  match '/auth/:provider/callback', :to => 'sessions#create'
  match '/auth/failure', :to => 'sessions#failure'
  #get   '/login', :to => 'sessions#new', :as => :login  
  
  # Twitter
  #match "auth/:provider/callback" => "tsessions#create"
  #match 'auth/failure', to: redirect('/')
  #match 'signout', to: 'sessions#destroy', as: 'signout'

  resources :dashboards do
    get "dashboards/index"
    get "dashboards/profile"
    get "dashboards/show_all_users"
  end
  
  match '/Dashboard', to: 'dashboards#index'
  match '/Profile', to: 'dashboards#profile'
  match '/ShowAllUsers', to: 'dashboards#show_all_users'
  
# Sample of named route:
  # match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)
  
  resources :users do
    post "users/update_profile"
    post "users/update_email_address"
    get "users/registration_success"
    get "users/signout_completely"
    
  end

  match '/SignUp',  to: 'users#new'
  match '/ManageProfile', to: 'users#edit'
  match '/UpdateProfile', to: 'users#update_profile'
  match '/UpdateEmailAddress', to: 'users#update_email_address'
  match '/SignOutCompletely', to: 'users#signout_completely'
  match '/RegistrationSuccess', to: 'users#registration_success'
  
  resources :home do
    get "home/index"
    get " home/help"
    get " home/about"
    get " home/contact"
  end
  
  match '/Index',    to: 'home#index'
  match '/Help',    to: 'home#help'
  match '/About',    to: 'home#about'
  match '/Contact',    to: 'home#contact'
  
  #resources :sessions, only: [:new, :create, :destroy]
  resources :user_sessions do #, only: [:new, :create, :destroy]
    post "user_sessions/signin_by_cookie"
    get "user_sessions/remove_cookies"
  end
  
  match '/SignIn',  to: 'user_sessions#new'
  match '/SignOut', to: 'user_sessions#destroy'
  match '/CheckCookieActiveForUser', to: 'user_sessions#signin_by_cookie'
  match '/RemoveCookies', to: 'user_sessions#remove_cookies'  
  
  root :to => "home#index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
