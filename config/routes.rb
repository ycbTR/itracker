Itrack::Application.routes.draw do

  resources :salutations
  resources :titles
  resources :reasons
  resources :medical_conditions

  resources :patients do
    collection { post :search, to: 'patients#index' }
    resources :patient_medical_conditions
    resources :visits do
      member do
        get :exams
        get :exam
        delete :exam
      end
      resources :patient_visit_reasons
    end
  end


  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".


  # routes only for users
  authenticated :user, lambda { |u| u.type == "Employee" } do
    root :to => "patients#index", :as => "authenticated_employee_root"
  end

# routes only for companies
  authenticated :user, lambda { |u| u.type == "Admin" } do
    root :to => "patients#index", :as => "authenticated_admin_root"
  end

  root 'application#index'


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end