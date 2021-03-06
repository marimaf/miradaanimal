Miradaanimal::Application.routes.draw do
  resources :raffles


  resources :dogs


  resources :members
  #resources :donations

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  match 'operativo' => 'members#volunteer', :as => :volunteer
  match 'padrinos' => 'members#padrinos', :as => :padrinos
  post 'create_padrino' => 'members#create_padrino', :as => :create_padrino
  match 'miembro' => 'members#new_member', :as => :member
  match 'create_member' => 'members#create_member', :as => :member
  match 'check' => 'members#check', :as => :check
  match 'thank_you' => 'members#thank_you', :as => :thank_you
  match 'rifa' => 'raffles#new', :as => :rifa
  match 'donaciones' => 'donations#new_donation'
  match 'cdonaciones' => 'donations#create'
  match 'thank_you_donation' => 'donations#thank_you_donation', :as => :thank_you_donation
  match 'waitlist' => 'dogs#waitlist'
  match 'waitlistview' => 'dogs#waitlistview'
  
  match 'toggle_verified' => 'raffles#toggle_verified', :as => :toggle_verified
  #match 'voluntarios' => 'registrations#volunteers', :as => :volunteers

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
 root :to => 'dogs#welcome'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
